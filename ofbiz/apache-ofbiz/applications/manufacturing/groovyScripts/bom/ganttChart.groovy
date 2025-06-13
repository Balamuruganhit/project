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
import org.apache.ofbiz.base.util.UtilHttp
import org.apache.ofbiz.webapp.control.*
userLogin = parameters.userLogin
def loadGanttchart(){
   
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

def ganttList = []


listOfMachine.eachWithIndex { production, i ->

    // Add PHASE (machine as group)
    def phase = [
        pID    : production.fixedAssetId,
        pName  : "${i + 1}. ${production.fixedAssetId}",
        pStart : "",
        pEnd   : "",
        pColor : "00ff00",
        pLink  : "",
        pMile  : 0,
        pRes   : "",
        pComp  : 0,
        pGroup : 1,
        pParent: 0,
        pOpen  : 1
    ]
    ganttList.add(phase)

    // Fetch related PROD_ORDER_TASKs
    def routingTasks = from('WorkEffort')
        .where([
            fixedAssetId     : production.fixedAssetId,
            workEffortTypeId : "PROD_ORDER_TASK",
            currentStatusId  : "PRUN_SCHEDULED"
        ])
        .orderBy('createdDate')
        .queryList()

    def loader = 987

    routingTasks.eachWithIndex { task, index ->

        // Fetch additional details
        def routingDetails = from('WorkEffortAssocFromView')
            .where([
                workEffortAssocTypeId: 'WORK_EFF_TEMPLATE',
                workEffortIdTo       : task.workEffortId
            ]).queryFirst()

        def proDetails = from('WorkEffort')
            .where([
                workEffortId     : task.workEffortParentId,
                workEffortTypeId : "PROD_ORDER_HEADER"
            ]).queryFirst()

        def productDetails = from('WorkEffortAndProduct')
            .where([
                workEffortId: task.workEffortParentId
            ]).queryFirst()

        def workorder = from("partyOrder")
            .where("productionRunId", task.workEffortParentId)
            .queryOne()

        def partyDetail = workorder ?
            from("WorkOrder").where("workOrderNumber", workorder.poNumber).queryOne() : [:]

        // Generate task color
        def r = (loader + index * 7) % 256
        def g = (loader + index * 13) % 256
        def b = (loader + index * 19) % 256
        def color = String.format("#%02X%02X%02X", r, g, b)

        // Dates
        def startDate = task.estimatedStartDate ? UtilDateTime.toDateString(task.estimatedStartDate, "MM/dd/yyyy HH:mm") : ""
        def endDate = task.estimatedCompletionDate ? UtilDateTime.toDateString(task.estimatedCompletionDate, "MM/dd/yyyy HH:mm") : ""

        // Add TASK
        ganttList.add([
            pID    : task.workEffortId,
            pName  : "${index + 1}. ${task.workEffortName}",
            pStart : startDate,
            pEnd   : endDate,
            pColor : color,
            pLink  : "/workeffort/control/EditWorkEffort?workEffortId=${task.workEffortId}",
            pMile  : 0,
            pRes   : task.workEffortParentId ?: "",
            pComp  : 0,
            pGroup : 0,
            pParent: production.fixedAssetId,
            pOpen  : 1,
            pDepend: "" // Add predecessor logic here if needed
        ])
    }
}
logInfo("Way" + ganttList)
logInfo("It is working")
// Return JSON to frontend
request.setAttribute("tasks", ganttList)
return "success"
}