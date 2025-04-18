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

Timestamp now = new Timestamp(System.currentTimeMillis())

// 1 minute ago
Timestamp oneMinuteAgo = new Timestamp(System.currentTimeMillis() - (60 * 1000))

// Today at 00:00:00
Calendar cal = Calendar.getInstance()
cal.set(Calendar.HOUR_OF_DAY, 0)
cal.set(Calendar.MINUTE, 0)
cal.set(Calendar.SECOND, 0)
cal.set(Calendar.MILLISECOND, 0)
Timestamp todayStart = new Timestamp(cal.getTimeInMillis())
if(parameters.poNumber){
// Query for first record created today and within last 1 minute
def result = EntityQuery.use(delegator)
    .from("WorkEffort") // Replace with your actual entity
    .where(EntityCondition.makeCondition([
        EntityCondition.makeCondition("createdStamp", EntityOperator.GREATER_THAN_EQUAL_TO, todayStart),
        EntityCondition.makeCondition("createdStamp", EntityOperator.GREATER_THAN_EQUAL_TO, oneMinuteAgo),
        EntityCondition.makeCondition("createdStamp", EntityOperator.LESS_THAN_EQUAL_TO, now)
    ], EntityOperator.AND))
    .orderBy("createdStamp") // Optional: earliest match
    .queryFirst()

productionRunId=result.workEffortId
logInfo('Uploaded file found; processing sub-content'+productionRunId)
productionType=parameters.party
poNumber=parameters.poNumber
logInfo('Uploaded file found; processing sub-content'+poNumber)
if(productionRunId){
    if(poNumber){
        
        partyName=from('OrderHeaderAndRoles').where('orderId',poNumber).queryList()
        def secondWorkEffort = (partyName.size() > 1) ? partyName.get(1) : null
        logInfo('Uploaded file found; processing sub-content'+ secondWorkEffort)
        Map<String, Object> partyAndOrderdetail = [
                productionRunId:productionRunId,
                partyName: secondWorkEffort.partyId,
                orderNumber:poNumber,
                orderDate:secondWorkEffort.orderDate,
                poNumber:productionType
            ]
            delegator.create("partyOrder", partyAndOrderdetail)
            logInfo('Uploaded file found; processing sub-content'+ partyAndOrderdetail)
    }
    logInfo('Uploaded file found; processing sub-content'+ productionRunId)
    partyDetail=from("partyOrder").where('productionRunId',productionRunId).queryFirst()
    logInfo('Uploaded file found; processing sub-content'+ partyDetail)
    context.partyDetail=partyDetail
}
}
if(parameters.productionRunId){
    logInfo('Uploaded file found; processing sub-content'+ productionRunId)
    partyDetail=from("partyOrder").where('productionRunId',productionRunId).queryOne()
    logInfo('Uploaded file found; processing sub-content'+ partyDetail)
    context.partyDetail=partyDetail
}