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

import org.apache.ofbiz.service.ServiceUtil


    // Retrieve the custRequestId from request parameters
    String requestId = parameters.custRequestId

    if(requestId){
        GenericValue requestItemSupplier = select("configId")
            .from("CustRequestItem")
            .where("custRequestId", requestId)
            .queryFirst()
        if(requestItemSupplier){String requestItem = requestItemSupplier.getString("configId")
        context.supplierID=requestItem}
        
    }
            
communicationId=parameters.communication
custRequestName=parameters.custRequestName

if(communicationId){
     
        Map commEventRequestContext = [custRequestId: requestId,
                                       communicationEventId: communicationId]
        run service: 'createCustRequestCommEvent', with: commEventRequestContext
    
        Debug.logInfo("Service Done in communication", "setterRequired")
}