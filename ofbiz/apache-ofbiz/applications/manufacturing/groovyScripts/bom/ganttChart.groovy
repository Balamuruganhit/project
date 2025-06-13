
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
import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.condition.EntityOperator

userLogin = parameters.userLogin
def loadGanttchart() { 
def machineToWorkEfforts = []
def productionRuns = from("WorkEffort")
    .where(EntityCondition.makeCondition([
        EntityCondition.makeCondition("workEffortTypeId", EntityOperator.EQUALS, "PROD_ORDER_HEADER"),
        EntityCondition.makeCondition("currentStatusId", EntityOperator.EQUALS, "PRUN_CREATED"),
    ], EntityOperator.AND))
    .orderBy("estimatedStartDate")
    .queryList()
def listOfMachine=from('FixedAsset').where(EntityCondition.makeCondition([
        EntityCondition.makeCondition("fixedAssetTypeId", EntityOperator.EQUALS, "PRODUCTION_EQUIPMENT"),
        EntityCondition.makeCondition("fixedAssetTypeId", EntityOperator.EQUALS, "GROUP_EQUIPMENT"),
    ], EntityOperator.OR)).queryList()
// logInfo("List Of production run Machine:"+ listOfMachine)
listOfMachine.each { machine ->
    String fixedAssetId = machine.fixedAssetId

    // Get all production runs assigned to this machine
    def assignedWorkEfforts = select('workEffortId')
        .from('WorkEffort')
        .where(['fixedAssetId':fixedAssetId,'workEffortTypeId':"PROD_ORDER_TASK"])
        .orderBy('createdDate')
        .queryList()

    // Collect only the IDs in a list
    def workEffortIds = assignedWorkEfforts.collect { it.workEffortId }

    // Store in the array as a map
    machineToWorkEfforts << [
        fixedAssetId    : fixedAssetId,
        workEffortIds   : workEffortIds
    ]
}
// logInfo("List Of Routing Under the Machine:"+ machineToWorkEfforts)

// Use date from first production run for chart start
if (productionRuns && productionRuns.first().estimatedStartDate)
    context.chartStart = productionRuns.first().estimatedStartDate
else
    context.chartStart = UtilDateTime.nowTimestamp()

// Use end date from last production run for chart end
if (productionRuns && productionRuns.last().estimatedCompletionDate)
    context.chartEnd = productionRuns.last().estimatedCompletionDate
else
    context.chartEnd = UtilDateTime.addDaysToTimestamp(UtilDateTime.nowTimestamp(), 14)

if (!productionRuns) return
def ganttList=[]
listOfMachine.eachWithIndex { production, i ->
   
    ganttList.add([ phaseNr : production.fixedAssetId,
    phaseName : production.fixedAssetId,
    workEffortTypeId : "PHASE",
    sequenceId : i.toString(),
    phaseSeqNum : i + 1])

    def routingTasks = from('WorkEffort')
        .where(['fixedAssetId':production.fixedAssetId,'workEffortTypeId':"PROD_ORDER_TASK",'currentStatusId':"PRUN_SCHEDULED"])
        .orderBy('createdDate')
        .queryList()
    def routingTask = select("workEffortId").from('WorkEffort')
        .where(['fixedAssetId':production.fixedAssetId,'workEffortTypeId':"PROD_ORDER_TASK"])
        .orderBy('createdDate')
        .queryList()
    
    
    loader = 987
    routingTasks.eachWithIndex { task, index ->
        
        def partyDetail=[:]
        def routingDetails = from('WorkEffortAssocFromView').where(['workEffortAssocTypeId':'WORK_EFF_TEMPLATE','workEffortIdTo':task.workEffortId]).queryList()
        def proDetails=from('WorkEffort').where(['workEffortId':task.workEffortParentId,'workEffortTypeId':"PROD_ORDER_HEADER"]).queryList()
        def productDetails=from('WorkEffortAndProduct').where(['workEffortId':task.workEffortParentId,'workEffortTypeId':"PROD_ORDER_HEADER"]).queryList()
        workorder=from("partyOrder").where('productionRunId',task.workEffortParentId).queryOne()
        if(workorder){
        partyDetail=from("WorkOrder").where('workOrderNumber',workorder.poNumber).queryOne()
        }
        
        def r = (loader + index * 7) % 256
        def g = (loader + index * 13) % 256
        def b = (loader + index * 19) % 256
        

        ganttList.add([
            taskId = task.workEffortId,
            taskNr = task.workEffortId,
            taskName = task.workEffortName,
            phaseNr = production.fixedAssetId,
            taskSeqNum = index + 1,
            estimatedStartDate = UtilDateTime.toDateString(task.estimatedStartDate ?: phase.estimatedStartDate, "MM/dd/yyyy HH:mm"),
            estimatedCompletionDate = UtilDateTime.toDateString(task.estimatedCompletionDate ?: UtilDateTime.addDaysToTimestamp(task.estimatedStartDate ?: phase.estimatedStartDate, 1), "MM/dd/yyyy HH:mm"),
            plannedHours = task.workEffortParentId,
            resource = "${plannedHours} ",
            color = String.format("#%02X%02X%02X", r, g, b),
            completion = "PO/SO No:${partyDetail.orderNumber?:" "} \\n WorkOrder Number:${partyDetail.workOrderNumber?:" "} \\nProduction Order No:${task.workEffortParentId} \\nProduction Order Name:${proDetails.workEffortName} \\nPart No: ${productDetails.productId} \\nQuantity:${proDetails.quantityToProduce} \\nPart Name: ${productDetails.internalName} \\nRouting Id: ${routingDetails.workEffortIdFrom} \\nRouting Name: ${routingDetails.workEffortName}\\n Routing Task Id: ${task.workEffortId} \\n Routing Task Name:${task.workEffortName} \\nstatus: ${proDetails.currentStatusId?"Scheduled":0}\\n Estimate Setup time: ${task.estimatedSetupMillis?:" "}\\n Estimate Run Time${task.estimatedStartDate} - ${task.estimatedCompletionDate} \\n Actual Setup Time: ${task.actualSetupMillis?:" "} \\n Actual Completion Date: ${task.actualStartDate?:" "}",
            workEffortTypeId = "TASK",
            currentStatusId = task.currentStatusId,
            url = "/workeffort/control/EditWorkEffort?workEffortId=${task.workEffortId}",
    ])
    }


logInfo('List Of task' + ganttList)
request.setAttribute("tasks", ganttList)
return "success"
}
}