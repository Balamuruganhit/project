<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->
<script type="application/javascript">
    var createReportDetailUrl = "${ofbizUrl(service='createReportDetail')}";
    console.log(createReportDetailUrl); // You can check the generated URL
    console.log(<@ofbizUrl>createReportDetails</@ofbizUrl>)
</script>
<form class="basic-form" id="AddReportDetail" name="AddReportDetail"  enctype="multipart/form-data">
  <table>
    <tbody>
      <tr>
        <td class="label"><label>${uiLabelMap.AuditReportNo}</label></td>
        <td> <input type="text" id="reportId"  name="reportId"/></td>
      </tr>
      <tr>
        <td class="label"><label>${uiLabelMap.FormFieldTitle_Question}</label></td>
        <td>
             <input type="text" id="question"  name="question"/>
        </td>
      </tr>
      <tr>
        <td class="label"><label>${uiLabelMap.AuditReportRating}</label></td>
        <td> <input type="text" id="rating" name="rating"/></td>
      </tr>
      
      <tr>
        <td class="label"><label>${uiLabelMap.AuditReportComment}</label></td>
        <td> <input type="text" id="comment" name="comment"/></td>
      </tr>
      <tr>
        <td class="label"><label>${uiLabelMap.AuditReportProof}</label></td>
        <td><input type="file" size="20" id="proof" name="proof"accept=".png,.gif,.jpg,.jpeg,.tiff,.tif"/></td>
      </tr>
    	<td class="label"><label>${uiLabelMap.AuditReportApprove}</label></td>
        <td> <input type="text" id="approve" name="approve"/></td>
      </tr>
      <tr>
        <td class="label"/>
        <td><button id="add-button">Add</button></td>
      </tr>
    </tbody>
  </table>
</form>
<table>
    <thead>
        <tr>
            <th>Report ID</th>
            <th>Question</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Proof</th>
            <th>Approver Name</th>
        </tr>
    </thead>
    <tbody id="data-table-body"></tbody>
</table>

<button id="submit-button">Submit</button>
