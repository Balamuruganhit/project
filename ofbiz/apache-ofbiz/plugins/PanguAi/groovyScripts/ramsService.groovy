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
import org.apache.ofbiz.base.util.UtilProperties
import org.apache.ofbiz.base.util.UtilValidate
import org.apache.ofbiz.entity.condition.EntityConditionBuilder
import org.apache.ofbiz.entity.GenericValue
import org.apache.ofbiz.entity.serialize.XmlSerializer
import org.apache.ofbiz.product.product.KeywordIndex
import org.apache.ofbiz.product.product.ProductWorker
import org.apache.ofbiz.service.*
import org.apache.ofbiz.base.util.*
import org.apache.ofbiz.entity.*
import java.sql.Timestamp
import java.util.List
def createRam(){
    List<Map<String, Object>> ramsDetails = parameters.ramsDetail
        
    logInfo('Uploaded file found; processing sub-content'+ramsDetails)
    def ramsNo=ramsDetails[-1].ramsNumber
    Map<String,Object> newHeader =[
        ramsNo:ramsDetails[-1].ramsNumber,
        productCode:ramsDetails[-1].productCode,
        system:ramsDetails[-1].system ,
        subsystem:ramsDetails[-1].subSystem ,
        subsubsystem:ramsDetails[-1].subSubSystem,
        rams:ramsDetails[-1].ramsResponsibility,
        date:ramsDetails[-1].date ,
        team:ramsDetails[-1].teamMembers,
        approver:ramsDetails[-1].approvedBy,
    ]
    delegator.create("ramsheader",newHeader)
    (0..<ramsDetails.size()-1).each{ i ->
        def rams = ramsDetails[i]
        def genId = delegator.getNextSeqId("ramsData")
        Map<String ,Object> mainReportDetails=[
            genId:genId,
            ramsNo:ramsNo,
            calculatorType:rams.name,
            int1:rams.int1,
            int2:rams.int2,
            int3:rams.int3,
            out1:rams.out1,
            out2:rams.out2,
            out3:rams.out3,
            out4:rams.out4,
            out5:rams.out5,
            out6:rams.out6,
        ]
    delegator.create("ramsData",mainReportDetails)
    logInfo('Uploaded file found; processing sub-content'+mainReportDetails)
    }
    
        
}
