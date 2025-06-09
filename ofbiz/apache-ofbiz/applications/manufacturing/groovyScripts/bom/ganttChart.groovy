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
ganttList = new LinkedList()
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

listOfMachine.eachWithIndex { production, i ->

    def phase = [:]
    phase.phaseId = production.fixedAssetId
    phase.phaseNr = production.fixedAssetId
    phase.phaseName = production.fixedAssetId
    phase.workEffortTypeId = "PHASE"
    phase.sequenceId = i.toString()
    phase.phaseSeqNum = i + 1
    ganttList.add(phase)

    def routingTasks = from('WorkEffort')
        .where(['fixedAssetId':production.fixedAssetId,'workEffortTypeId':"PROD_ORDER_TASK",'currentStatusId':"PRUN_SCHEDULED"])
        .orderBy('createdDate')
        .queryList()
    def routingTask = select("workEffortId").from('WorkEffort')
        .where(['fixedAssetId':production.fixedAssetId,'workEffortTypeId':"PROD_ORDER_TASK"])
        .orderBy('createdDate')
        .queryList()
    logInfo('Routing' + routingTask)
    loader = 987
    routingTasks.eachWithIndex { task, index ->
        def taskMap = [:]
        taskMap.taskId = task.workEffortId
        taskMap.taskNr = task.workEffortId
        taskMap.taskName = task.workEffortName
        taskMap.phaseNr = production.fixedAssetId
        taskMap.taskSeqNum = index + 1
        taskMap.estimatedStartDate = UtilDateTime.toDateString(task.estimatedStartDate ?: phase.estimatedStartDate, "MM/dd/yyyy HH:mm")
        taskMap.estimatedCompletionDate = UtilDateTime.toDateString(task.estimatedCompletionDate ?: UtilDateTime.addDaysToTimestamp(task.estimatedStartDate ?: phase.estimatedStartDate, 1), "MM/dd/yyyy HH:mm")
        taskMap.plannedHours = task.workEffortParentId
        taskMap.resource = "${taskMap.plannedHours} "
        def r = (loader + index * 7) % 256
        def g = (loader + index * 13) % 256
        def b = (loader + index * 19) % 256
        taskMap.color = String.format("#%02X%02X%02X", r, g, b)
        taskMap.completion = "PTS_COMPLETED".equals(task.currentStatusId) ? 100 : 0
        taskMap.workEffortTypeId = "TASK"
        taskMap.currentStatusId = task.currentStatusId
        taskMap.url = "/workeffort/control/EditWorkEffort?workEffortId=${task.workEffortId}"


        ganttList.add(taskMap)
    }
}

context.phaseTaskList = ganttList
logInfo("Gantt Chart Data: ${ganttList}")
