/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import org.apache.ofbiz.base.util.Debug
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.order.shoppingcart.ShoppingCartEvents
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

def finder(){
    // Ensure request and response objects are available from context
    HttpServletRequest request = context.request
    HttpServletResponse response = context.response

    // Retrieve the custRequestId from request parameters
    String requestId = parameters.custRequestId

    if(requestId){
        GenericValue requestItemSupplier = select("configId")
            .from("CustRequestItem")
            .where("custRequestId", requestId)
            .queryFirst()

        if (requestItemSupplier) {
            String supplier = requestItemSupplier.getString("configId")
            String finalMode = "PURCHASE_ORDER"

            // Set attributes required by initializeOrderEntry
            request.setAttribute("supplierPartyId", supplier)
            request.setAttribute("orderMode", finalMode)
            request.setAttribute("currencyUomId", "USD")
            request.setAttribute("finalizeMode", "type")
            request.setAttribute("billToCustomerPartyId", "Company")
            request.setAttribute("userLoginId", "admin")

            // Debugging: Log request attributes before calling the event
            Debug.logInfo("Request Attributes: supplierPartyId=${supplier}, orderMode=${finalMode}, currencyUomId=USD, finalizeMode=type, billToCustomerPartyId=Company, userLoginId=admin", "setterRequired")

            try {
                String resultList = ShoppingCartEvents.initializeOrderEntry(request, response)
                String cart = ShoppingCartEvents.setOrderCurrencyAgreementShipDates(request, response)
                Debug.logInfo("Result from initializeOrderEntry: ${cart}", "setterRequired")

                if ("error".equals(resultList)) {
                    Debug.logError("initializeOrderEntry failed! Check OFBiz logs for details.", "setterRequired")
                } else {
                    
                    Debug.logInfo("Result from setOrderCurrencyAgreementShipDates: ${cart}", "setterRequired")
                }
            } catch (Exception e) {
                Debug.logError("Error while initializing order entry: ${e.getMessage()}", "setterRequired")
            }
        } else {
            Debug.logWarning("No supplier found for custRequestId: ${requestId}", "setterRequired")
        }
    } else {
        Debug.logWarning("custRequestId is missing in request parameters", "setterRequired")
    }
}
