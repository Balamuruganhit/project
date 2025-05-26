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
def x=0
workEffortId=parameters.workEffortId
def bomProductList = [:]
productList = from("WorkEffortGoodStandard")
            .select("productId")
            .where("workEffortId", parameters.workEffortId)
            .queryList()
Debug.logInfo(" items for custRequestId: " + productList, "listBom")
if(productList){
    productList.each{ product ->
        productId=product.productId
        Debug.logInfo(" items for custRequestId: " + productId, "listBom")
        productListBom=from("ProductAssoc").where("productId",productId).queryList()
                     Debug.logInfo(" items for productListBom: " + productListBom, "listBom")

        productListBom.each{ productBom ->
            Map bomListItem = [:]
            bomListItem.put("ProductId",productId)
            bomListItem.put("ProductIdTo",productBom.productIdTo)
            bomListItem.put("productAssocTypeId",productBom.productAssocTypeId)
            bomListItem.put("sequenceNum",productBom.sequenceNum)
            bomListItem.put("quantity",productBom.quantity)
            bomListItem.put("fromDate",productBom.fromDate)
            bomListItem.put("thruDate",productBom.thruDate)
            bomProductList.put(x++,bomListItem)
            Debug.logInfo(" items for bomListItem: " + bomListItem, "listBom")
             Debug.logInfo(" items for bomProductList: " + bomProductList, "listBom")
            
        }
    }
}
Debug.logInfo(" items for custRequestId: " + bomProductList, "listBom")
context.resultList = bomProductList.values().toList()