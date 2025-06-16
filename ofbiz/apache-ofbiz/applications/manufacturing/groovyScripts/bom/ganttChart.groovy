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
import org.apache.ofbiz.entity.serialize.XmlSerializer
import org.apache.ofbiz.product.product.KeywordIndex
import org.apache.ofbiz.product.product.ProductWorker
import org.apache.ofbiz.service.*
import org.apache.ofbiz.base.util.*
import org.apache.ofbiz.entity.*
import java.sql.Timestamp
import java.util.List
import java.text.SimpleDateFormat
import java.util.Calendar
import java.sql.Date
userLogin = parameters.userLogin
Timestamp startTimestamp= new Timestamp(System.currentTimeMillis());
def calendar = Calendar.getInstance()
calendar.setTimeInMillis(System.currentTimeMillis())
calendar.add(Calendar.DAY_OF_MONTH, 2)

def endTimestamp = new Timestamp(calendar.getTimeInMillis())

def conditions = []
 if (parameters.fromDate) {
            
                def sdf = new SimpleDateFormat("yyyy-MM-dd")
                sdf.setLenient(false) // enforce strict format parsing
                def utilDate = sdf.parse(parameters.fromDate.trim())
                 startTimestamp = new Timestamp(utilDate.getTime())
                def utilDate2 = sdf.parse(parameters.toDate.trim())
                endWithTime = new Timestamp(utilDate2.getTime())
                def cal = Calendar.getInstance()
                cal.setTime(endWithTime)
                cal.set(Calendar.HOUR_OF_DAY, 00)
                cal.set(Calendar.MINUTE, 59);
                cal.set(Calendar.SECOND, 59);
                cal.set(Calendar.MILLISECOND, 999);
                endTimestamp =  new Timestamp(cal.getTimeInMillis())
                

               
        }
 logInfo("Searching between: ${startTimestamp} and ${endTimestamp}")
 
 context.start= UtilDateTime.toDateString(startTimestamp ?: startTimestamp, "dd/MM/yyyy")
 context.end=UtilDateTime.toDateString(endTimestamp ?: endTimestamp, "dd/MM/yyyy ")
 context.startInput= UtilDateTime.toDateString(startTimestamp ?: startTimestamp, "yyyy/MM/dd")
 context.endInput=endTimestamp
 logInfo("Searching between: ${UtilDateTime.toDateString(endTimestamp ?: endTimestamp, "dd/MM/yyyy HH:MM:ss")} and ${endTimestamp}")
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
    loader = 987
    // logInfo("List Of Routing Under the Machine:"+ machineToWorkEfforts)
    def productionIdColor=select('workEffortId').from('WorkEffort').where(EntityCondition.makeCondition([
                        EntityCondition.makeCondition("workEffortTypeId", EntityOperator.EQUALS, "PROD_ORDER_HEADER"),
                        EntityCondition.makeCondition("currentStatusId", EntityOperator.EQUALS, "PRUN_SCHEDULED"),
                    ], EntityOperator.AND)).queryList()
    def productionCount = productionIdColor.size()
    def colorPalette = []
    (0..<productionCount).each { i ->
        def r = (loader + i * 7) % 256
        def g = (loader + i * 13) % 256
        def b = (loader + i * 19) % 256
        colorPalette << String.format("#%02X%02X%02X", r, g, b)// Convert each to hex
    }
    logInfo('Color array' + colorPalette)
    def productionColorMap = [:]
    def colorIndex = 0
    productionIdColor.each { productionId ->
        productionColorMap[productionId.workEffortId] = colorPalette[colorIndex]
        colorIndex++
    }
    logInfo('Color array' + productionColorMap)
machineToWorkEfforts.eachWithIndex { production, i ->

    def phase = [:]
    phase.phaseId = production.fixedAssetId
    phase.phaseNr = production.fixedAssetId
    phase.phaseName = production.fixedAssetId
    phase.workEffortTypeId = "PHASE"
    phase.sequenceId = i.toString()
    phase.phaseSeqNum = i + 1
    ganttList.add(phase)

    def routingTasks = from('WorkEffort')
        .where(EntityCondition.makeCondition([
                    EntityCondition.makeCondition("estimatedStartDate", EntityOperator.GREATER_THAN_EQUAL_TO, startTimestamp),
                    EntityCondition.makeCondition("estimatedStartDate", EntityOperator.LESS_THAN, endTimestamp),
                    EntityCondition.makeCondition("fixedAssetId", EntityOperator.EQUALS, production.fixedAssetId),
                    EntityCondition.makeCondition("workEffortTypeId", EntityOperator.EQUALS, "PROD_ORDER_TASK"),
                    EntityCondition.makeCondition("currentStatusId", EntityOperator.EQUALS, "PRUN_SCHEDULED"),
                ], EntityOperator.AND))
        .orderBy('createdDate')
        .queryList()

    routingTasks.eachWithIndex { task, index ->
        def taskMap = [:]
        def partyDetail=[:]
        def routingDetails = from('WorkEffortAssocFromView').where(['workEffortAssocTypeId':'WORK_EFF_TEMPLATE','workEffortIdTo':task.workEffortId]).queryList()
        def proDetails=from('WorkEffort').where(['workEffortId':task.workEffortParentId,'workEffortTypeId':"PROD_ORDER_HEADER"]).queryList()
        def productDetails=from('WorkEffortAndProduct').where(['workEffortId':task.workEffortParentId,'workEffortTypeId':"PROD_ORDER_HEADER"]).queryList()
        workorder=from("partyOrder").where('productionRunId',task.workEffortParentId).queryOne()
        if(workorder){
        partyDetail=from("WorkOrder").where('workOrderNumber',workorder.poNumber).queryOne()
        }
        taskMap.taskId = task.workEffortId
        taskMap.taskNr = task.workEffortId
        taskMap.taskName = task.workEffortName
        taskMap.phaseNr = production.fixedAssetId
        taskMap.taskSeqNum = index + 1
        taskMap.estimatedStartDate = UtilDateTime.toDateString(task.estimatedStartDate ?: phase.estimatedStartDate, "MM/dd/yyyy HH:mm")
        taskMap.estimatedCompletionDate = UtilDateTime.toDateString(task.estimatedCompletionDate ?: UtilDateTime.addDaysToTimestamp(task.estimatedStartDate ?: phase.estimatedStartDate, 1), "MM/dd/yyyy HH:mm")
        taskMap.plannedHours = task.workEffortParentId
        taskMap.resource = "${taskMap.plannedHours} "
        
        taskMap.color = productionColorMap[task.workEffortParentId]
        taskMap.completion = "PO/SO No:${partyDetail.orderNumber?:" "} \\n WorkOrder Number:${partyDetail.workOrderNumber?:" "} \\nProduction Order No:${task.workEffortParentId} \\nProduction Order Name:${proDetails.workEffortName} \\nPart No: ${productDetails.productId} \\nQuantity:${proDetails.quantityToProduce} \\nPart Name: ${productDetails.internalName} \\nRouting Id: ${routingDetails.workEffortIdFrom} \\nRouting Name: ${routingDetails.workEffortName}\\n Routing Task Id: ${task.workEffortId} \\n Routing Task Name:${task.workEffortName} \\nstatus: ${proDetails.currentStatusId?"Scheduled":0}\\n Estimate Setup time: ${task.estimatedSetupMillis?:" "}\\n Estimate Run Time${task.estimatedStartDate} - ${task.estimatedCompletionDate} \\n Actual Setup Time: ${task.actualSetupMillis?:" "} \\n Actual Completion Date: ${task.actualStartDate?:" "}"
        taskMap.workEffortTypeId = "TASK"
        taskMap.currentStatusId = task.currentStatusId
        taskMap.url = "/workeffort/control/EditWorkEffort?workEffortId=${task.workEffortId}"


        ganttList.add(taskMap)
    }
}

context.phaseTaskList = ganttList
logInfo("Gantt Chart Data: ${ganttList}")