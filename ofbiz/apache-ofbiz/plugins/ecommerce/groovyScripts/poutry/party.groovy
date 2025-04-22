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

def createparty(){
    try {
     List<Map<String, Object>> femaDetails = parameters.femaDetails
    
    logInfo('Uploaded file found; processing sub-content'+femaDetails)
     
        String femaId = femaDetails[0].dfema
        String drawing = femaDetails[0].drawing
        String part = femaDetails[0].part
        String rev = femaDetails[0].rev
        String comp =femaDetails[0].comp
        String design = femaDetails[0].design
        String prepare = femaDetails[0].prepare
        String team = femaDetails[0].team
        String date= femaDetails[0].date
        Map<String, Object> newReport = [
                femaId : femaId,
                drawing : drawing,
                part : part,
                rev : rev,
                comp : comp,
                design : design,
                prepareField : prepare,
                team : team,
                femaDate : date,
             
            ]
            delegator.create("FemaTitleDetail", newReport)
    if (femaDetails.size() > 1) {
            (1..<femaDetails.size()).each { i ->
                def fematable = femaDetails[i]
                if (fematable != null && fematable instanceof Map) {
                    def genId = delegator.getNextSeqId("FemaTableDetail")
                    Map<String, Object> newTable = [
                        genId: genId,
                        femaId: femaId,
                        item: fematable.item,
                        functionPart: fematable.function,
                        feverity: fematable.achieve,
                        failureMode: fematable.FailureMode,
                        potentialEffects: fematable.PotentialEffects,
                        severity: fematable.Severity,
                        potentialCause: fematable.PotentialCause,
                        occurrence: fematable.Occurrence,
                        designControl: fematable.DesignControl,
                        detectionControl  :fematable.DetectionControl,
                        detection: fematable.Detection,
                        rPN: fematable.RPN,
                        action: fematable.Action,
                        responsibility: fematable.Responsibility,
                        actionTaken: fematable.ActionTaken,
                        severity1: fematable.Severity1,
                        occurrence1: fematable.Occurrence1,
                        detection1: fematable.Detection1,
                        rPN1: fematable.RPN1
                    ]

                    delegator.create("FemaTableDetail", newTable)
                }
            }
        }
    return success("Report details stored successfully.")
    } catch (Exception e) {
        logError("Error storing report details: ${e.message}")
        return error("Failed to store report details: ${e.message}")
    }

}
