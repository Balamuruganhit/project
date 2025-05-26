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

context.partyName=from('FarmerParty').queryList()
context.itemName=from('Inventoryfarmer').queryList()
if(parameters.itemName){
    item=from('Inventoryfarmer').where("iname", parameters.itemName).queryOne()
    if(item){
        if(parameters.productName){
            int quantity = (parameters.quantity ?: "0").toString().toInteger()
            item.iunit = item.iunit - quantity
            item.store()
        }else{
        int quantity = (parameters.quantity ?: "0").toString().toInteger()
        item.iunit = item.iunit +quantity
        item.store()
        }
    }
    else{
    def genId = delegator.getNextSeqId("Inventoryfarmer") 
    Map<String, Object> newReport = [
                    itemId : genId,
                    iname : parameters.itemName,
                    icategory : parameters.itemCategory,
                    istockLevel : parameters.unit,
                    iunit :parameters. quantity,
                    isupplier : parameters.supplier,
                ]
                delegator.create("Inventoryfarmer", newReport)
    logInfo("Creating new FarmerParty entry: ${newReport}")
    }
}
inventoryDetail=from('Inventoryfarmer').queryList()
logInfo("Raw Inventory List: ${inventoryDetail}")
context.inventoryList = inventoryDetail
logInfo("Grouped Inventory List: ${context.inventoryList}")

if(parameters.indexer){
    item=from('Inventoryfarmer').where("iname", parameters.productName).queryOne()
    if(item){
    int quantity = (parameters.itemCategory ?: "0").toString().toInteger()
    item.iunit = item.iunit - quantity
    item.store()
    }
    genId = delegator.getNextSeqId("OrderMange") 
    Map<String, Object> newReport = [
                    statusId : genId,
                    product : parameters.productName,
                    quantity : parameters.itemCategory,
                    rate : parameters.rate,
                    typeMonitor : parameters.typeMonitor,
                ]
                delegator.create("OrderMange", newReport)
    logInfo("Creating new FarmerParty entry: ${newReport}")
    
}


