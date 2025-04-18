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
 
import org.apache.ofbiz.manufacturing.jobshopmgt.ProductionRun
productionRunId = parameters.workEffort

logInfo('Uploaded file found; processing sub-content'+ productionRunId)
if (productionRunId) {
    ProductionRun productionRun = new ProductionRun(productionRunId, delegator, dispatcher)
    if (productionRun.exist()) {
        productionRunId = productionRun.getGenericValue().workEffortId
        context.productionRunId = productionRunId
        context.productionRun = productionRun.getGenericValue()
        // Prepare production run header data
        productionRunData = [:]
        productionRunData.productionRunId = productionRunId
        productionRunData.productId = productionRun.getProductProduced().productId
        productionRunData.currentStatusId = productionRun.getGenericValue().currentStatusId
        productionRunData.facilityId = productionRun.getGenericValue().facilityId
        productionRunData.workEffortName = productionRun.getProductionRunName()
        productionRunData.description = productionRun.getDescription()
        productionRunData.quantity = productionRun.getQuantity()
        productionRunData.estimatedStartDate = productionRun.getEstimatedStartDate()
        productionRunData.estimatedCompletionDate = productionRun.getEstimatedCompletionDate()
        productionRunData.actualCompletionDate = productionRun.getGenericValue().getTimestamp("actualCompletionDate")
        context.completionProduction=productionRunData.actualCompletionDate.toLocalDate().toString()
        product=from('Product').where('productId',productionRun.getProductProduced().productId).queryOne()
        
        context.product=product
		manufacturer = from("WorkEffortPartyAssignment").where("workEffortId", productionRunId, "roleTypeId", "MANUFACTURER").filterByDate().queryFirst()
        if (manufacturer){
            productionRunData.manufacturerId = manufacturer.partyId
        }
        context.productionRunData = productionRunData
        context.productionRunRoutingTasks = productionRun.getProductionRunRoutingTasks()
        context.productionRunComponents = productionRun.getProductionRunComponents()
        productionRunComponents = productionRun.getProductionRunComponents()
        context.lengthProduction=productionRunComponents.size
        context.quantity = productionRun.getQuantity()
        inventoryItems = from("WorkEffortInventoryProduced").where("workEffortId", productionRunId).queryList()
        context.inventoryItems = inventoryItems
        inventoryItems.each {inventory ->
          context.invDate= inventory.createdStamp.toLocalDate().toString()

        }
        logInfo('Uploaded file found; processing sub-content'+ productionRunComponents)
    }
    partyDetail=from("partyOrder").where('productionRunId',productionRunId).queryOne()
    logInfo('Uploaded file found; processing sub-content'+ partyDetail)
    context.orderDate=partyDetail.orderDate.toLocalDate().toString()
    context.proDate=productionRunData.estimatedStartDate.toLocalDate().toString()
    context.partyDetail=partyDetail
}

logInfo('Uploaded file found; processing sub-content'+ productionRunId)