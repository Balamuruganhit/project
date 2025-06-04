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



import org.apache.ofbiz.entity.util.EntityUtil
import org.apache.ofbiz.entity.condition.EntityCondition
import org.apache.ofbiz.entity.condition.EntityOperator

// Get the delegator and parameters
def delegator = delegator
def parameters = parameters
def context = context

// Get the master production ID from input parameters
String masterProductionId = parameters.productionRunId

// Initialize the set to store related production IDs
Set<String> allProductionIds = new LinkedHashSet<>()
allProductionIds.add(masterProductionId)

// Define recursive function to collect sub-productions
def collectSubProductions
collectSubProductions = { String workEffortId ->
    def assocList = delegator.findList("WorkEffortAssoc",
        EntityCondition.makeCondition([
            EntityCondition.makeCondition("workEffortIdFrom", workEffortId),
            EntityCondition.makeCondition("workEffortAssocTypeId", "WORK_EFF_PRECEDENCY") // Or your specific type
        ]),
        null, null, null, false)

    assocList.each { assoc ->
        String childId = assoc.workEffortIdTo
        if (!allProductionIds.contains(childId)) {
            allProductionIds.add(childId)
            collectSubProductions(childId)
        }
    }
}

// Start the recursion
collectSubProductions(masterProductionId)

// Now fetch all WorkEffort records
def relatedWorkEfforts = delegator.findList("WorkEffort",
    EntityCondition.makeCondition("workEffortId", EntityOperator.IN, allProductionIds.toList()),
    null, null, null, false)
logInfo("output FileId" + allProductionIds)
// Put into context
context.allProductionWorkEfforts = relatedWorkEfforts

