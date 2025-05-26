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

 import org.apache.ofbiz.base.util.UtilDateTime
import org.apache.ofbiz.base.util.UtilProperties
import org.apache.ofbiz.base.util.UtilValidate
import org.apache.ofbiz.entity.condition.EntityConditionBuilder
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.serialize.XmlSerializer
import org.apache.ofbiz.product.product.KeywordIndex
import org.apache.ofbiz.product.product.ProductWorker
import org.apache.ofbiz.service.*
import org.apache.ofbiz.base.util.*
import org.apache.ofbiz.entity.*
import java.sql.Timestamp
import java.util.List


context.partyName=from('FarmerParty').select('name').queryList()
if(parameters.supplier){
    Map result = ServiceUtil.returnSuccess()
    def genId = delegator.getNextSeqId("OrderFarmer") 
    item=from('Inventoryfarmer').where("iname", parameters.productName).queryOne()
    if(item){
        if(parameters.orderType == "Purchase"){
        int quantity = (parameters.quantity ?: "0").toString().toInteger()
        item.iunit = item.iunit +quantity
        item.store()
        logInfo("Creating new Purchase entry: ${item} ")
        }else{
        int quantity = (parameters.quantity ?: "0").toString().toInteger()
        item.iunit = item.iunit - quantity
        item.store()
        logInfo("Creating new Salse entry: ${item}")  
        }
    }
    Map<String, Object> newReport = [
                    orderId : genId,
                    orderType : parameters.orderType,
                    customerName : parameters.supplier,
                    product : parameters.productName,
                    quantity :parameters. quantity + parameters.unit,
                    rate : parameters.rate,
                ]
                delegator.create("OrderFarmer", newReport)
     logInfo("Creating new FarmerParty entry: ${newReport}")
    result.successMessage = "Party details saved successfully."
    return result
}

context.orderList=from('OrderFarmer').queryList()
