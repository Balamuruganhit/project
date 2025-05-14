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

def productionRuns = from("WorkEffort")
    .where(EntityCondition.makeCondition([
        EntityCondition.makeCondition("workEffortTypeId", EntityOperator.EQUALS, "PROD_ORDER_HEADER"),
        EntityCondition.makeCondition("currentStatusId", EntityOperator.EQUALS, "PRUN_CREATED"),
    ], EntityOperator.AND))
    .orderBy("estimatedStartDate")
    .queryList()

logInfo("GanttList for Manufacturing: ${productionRuns}")

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

productionRuns.eachWithIndex { production, i ->

    def phase = [:]
    phase.phaseId = production.workEffortId
    phase.phaseNr = production.workEffortId
    phase.phaseName = production.workEffortName
    phase.workEffortTypeId = "PHASE"
    phase.sequenceId = i.toString()
    phase.phaseSeqNum = i + 1
    phase.estimatedStartDate = production.estimatedStartDate ?: UtilDateTime.nowTimestamp()
    phase.estimatedCompletionDate = production.estimatedCompletionDate ?: UtilDateTime.addDaysToTimestamp(phase.estimatedStartDate, 3)
    phase.startDate = phase.estimatedStartDate
    phase.completionDate = phase.estimatedCompletionDate
    phase.plannedHours = production.estimatedMilliSeconds != null ? production.estimatedMilliSeconds / 3600000 : 0
    phase.currentStatusId = production.currentStatusId
    ganttList.add(phase)

    // Get associated routing tasks
    def taskConds = EntityCondition.makeCondition([
        EntityCondition.makeCondition("workEffortParentId", EntityOperator.EQUALS, production.workEffortId),
        EntityCondition.makeCondition("workEffortTypeId", EntityOperator.EQUALS, "PROD_ORDER_TASK")
    ], EntityOperator.AND)

    def routingTasks = from("WorkEffort")
        .where(taskConds)
        .orderBy("sequenceNum")
        .queryList()

    routingTasks.eachWithIndex { task, index ->
        def taskMap = [:]
        taskMap.taskId = task.workEffortId
        taskMap.taskNr = task.workEffortId
        taskMap.taskName = task.workEffortName
        taskMap.phaseNr = production.workEffortId
        taskMap.taskSeqNum = index + 1
        taskMap.estimatedStartDate = UtilDateTime.toDateString(task.estimatedStartDate ?: phase.estimatedStartDate, "MM/dd/yyyy HH:mm")
        taskMap.estimatedCompletionDate = UtilDateTime.toDateString(task.estimatedCompletionDate ?: UtilDateTime.addDaysToTimestamp(task.estimatedStartDate ?: phase.estimatedStartDate, 1), "MM/dd/yyyy HH:mm")
        taskMap.plannedHours = task.estimatedMilliSeconds != null ? task.estimatedMilliSeconds / 3600000 : 0
        taskMap.resource = "${taskMap.plannedHours} Hrs"
        taskMap.completion = "PTS_COMPLETED".equals(task.currentStatusId) ? 100 : 0
        taskMap.workEffortTypeId = "TASK"
        taskMap.currentStatusId = task.currentStatusId
        taskMap.url = "/workeffort/control/EditWorkEffort?workEffortId=${task.workEffortId}"

        // Add predecessor if exists
        def predecessors = from("WorkEffortAssoc")
            .where("workEffortIdTo", task.workEffortId)
            .queryList()

        if (predecessors) {
            taskMap.preDecessor = predecessors.collect { it.workEffortIdFrom }.join(", ")
        }

        ganttList.add(taskMap)
    }
}

context.phaseTaskList = ganttList
logInfo("Gantt Chart Data: ${ganttList}")
