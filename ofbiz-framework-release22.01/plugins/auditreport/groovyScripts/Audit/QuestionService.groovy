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

/**
 * Create a Question
 */
def createQuestion() {
    Map result = success()
    if (!(security.hasEntityPermission("AUDITREPORT", "_CREATE", parameters.userLogin)
            || security.hasEntityPermission("AUDITREPORT_ROLE", "_CREATE", parameters.userLogin))) {
        return error(UtilProperties.getMessage("AuditReportUiLabels", "AuditReportViewPermissionError", parameters.locale))
    }

    GenericValue newEntity = makeValue("Question", parameters)
    if (!newEntity.questionId) {
        newEntity.questionId = delegator.getNextSeqId("Question")
    } else {
        String errorMessage = UtilValidate.checkValidDatabaseId(newEntity.questionId)
        if (errorMessage) {
            return error(errorMessage)
        }
        GenericValue dummyProduct = from("Question").where(parameters).queryOne()
        if (dummyProduct) {
            return error(UtilProperties.getMessage("CommonErrorUiLabels", "CommonErrorDuplicateKey", parameters.locale))
        }
    }
    newEntity.question=parameters.question
    result.questionId = newEntity.questionId
	result.question=newEntity.question
   
    result.successMessage = UtilProperties.getMessage("AuditReportUiLabels", "AuditReportCreateSuccess", parameters.locale)
    newEntity.create()
    return result
/*
 *  if setting the primaryProductCategoryId create a member entity too 
 *  THIS IS REMOVED BECAUSE IT CAUSES PROBLEMS FOR WORKING ON PRODUCTION SITES
 *  <if-not-empty field="newEntity.primaryProductCategoryId">
 *  <make-value entity-name="ProductCategoryMember" value-field="newMember"/>
 *  <set from-field="productId" map-name="newEntity" to-field-name="productId" to-map-name="newMember"/>
 *  <set from-field="primaryProductCategoryId" map-name="newEntity" to-field-name="productCategoryId" to-map-name="newMember"/>
 *  <now-timestamp field="nowStamp"/>
 *  <set from-field="nowStamp" field="newMember.fromDate"/>
 *  <create-value value-field="newMember"/>
 *   </if-not-empty>
 */

    // if the user has the role limited position, add this product to the limit category/ies


    return result
}
def createReportDetail(){
    Map result = success()
     if (!(security.hasEntityPermission("AUDITREPORT", "_CREATE", parameters.userLogin)
            || security.hasEntityPermission("AUDITREPORT_ROLE", "_CREATE", parameters.userLogin))) {
        return error(UtilProperties.getMessage("AuditReportUiLabels", "AuditReportViewPermissionError", parameters.locale))
    }
   def upload = parameters.proof
    try {
        // Validate input
        if (!parameters.proof) {
            return ServiceUtil.returnError("No file uploaded.")
        }
        
        GenericValue newEntity = makeValue("ReportContent", parameters)
        if (upload instanceof java.nio.ByteBuffer) {
            byte[] byteArray = new byte[upload.remaining()]
            upload.get(byteArray) // Copy ByteBuffer content into the byte array
            newEntity.documentContent = byteArray // Set to the entity's blob field
        }
        newEntity.reportId=parameters.reportId
        newEntity.question = parameters.question
        newEntity.rating = parameters.rating
        newEntity.comment = parameters.comment
        newEntity.approverName = parameters.approve
        newEntity.create()
        result.successMessage = UtilProperties.getMessage("AuditReportUiLabels", "AuditReportCreateSuccess", parameters.locale)
        return ServiceUtil.returnSuccess("Document feedback saved successfully", [reportId: reportId])
    }
    catch (Exception e) {
        return ServiceUtil.returnError("Error saving document feedback: ${e.message}")
    }

    
}