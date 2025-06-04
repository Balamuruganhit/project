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



import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.condition.EntityOperator
import org.apache.ofbiz.entity.util.EntityUtilProperties
import java.sql.Timestamp
import java.util.Calendar
import org.apache.ofbiz.entity.util.EntityQuery
import org.apache.ofbiz.service.ServiceUtil
import org.apache.ofbiz.manufacturing.jobshopmgt.ProductionRun
// Get the delegator and parameters
def delegator = delegator
def parameters = parameters
def context = context
def userLogin = context.userLogin
def statusId = "PRUN_SCHEDULED" 
status=parameters.statusId
// Get the master productistatuson ID from input parameters

String masterProductionId = parameters.productionRunId

if(status){
Set<String> collectedIds = new HashSet<>()
collectedIds.add(masterProductionId)

def findSubProductions
findSubProductions = { String parentId ->
    def assocList = EntityQuery.use(delegator)
        .from("WorkEffortAssoc")
        .where([workEffortIdTo: parentId, workEffortAssocTypeId: "WORK_EFF_PRECEDENCY"])
        .queryList()

    assocList.each { assoc ->
        def childId = assoc.workEffortIdFrom
        if (!collectedIds.contains(childId)) {
            collectedIds.add(childId)
            findSubProductions(childId)
        }
    }
}

// Start recursion
findSubProductions(masterProductionId)

// Optional: Fetch full WorkEffort data


context.productionList = collectedIds
collectedIds.each { workEffortId ->
    def serviceContext = [:]
    serviceContext.put("productionRunId", workEffortId)
    serviceContext.put("statusId", statusId)
    serviceContext.put("userLogin", userLogin)

    try {
        def result = dispatcher.runSync("quickChangeProductionRunStatus", serviceContext)
        if (ServiceUtil.isError(result)) {
            logError("Failed for ID: ${workEffortId}, Reason: ${ServiceUtil.getErrorMessage(result)}")
        } else {
            logInfo("Successfully updated: ${workEffortId}")
        }
    } catch (Exception e) {
        logError("Exception while updating ${workEffortId}: ${e.message}")
    }
}
logInfo("output FileId" + collectedIds)

}
