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
import org.apache.ofbiz.manufacturing.jobshopmgt.ProductionRun
context.ListWorkOrder=from('WorkOrder').queryList()

if(parameters.workOrderNumber){
    context.workOrder=from('WorkOrder').where("workOrderNumber",parameters.workOrderNumber).queryOne()
    logInfo('workOrder'+ context.workOrder)
}

if(parameters.update == "update"){
    logInfo('workOrder statsus change')
    workOrder=from('WorkOrder').where("workOrderNumber",parameters.workOrderNumber).queryOne()
    workOrder.set("status",parameters.status) 
    workOrder.store()
}

