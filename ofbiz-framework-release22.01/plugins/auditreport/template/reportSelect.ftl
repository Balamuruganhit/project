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
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>


<form>
    <div>
        <label class="label">${uiLabelMap.AuditReportList}</label>
        <select name="reportId" id="reportgenId">
                    <#list reportListId as id>
                        <option value="${id.reportId!}">Report ${id.reportId!}</option>
                    </#list>
                    <option selected="" value="Select the Report">Select the Report</option>
        </select>
    </div>
    <div>
        <input type="submit" value="Submit" />
    </div>
</form>

<div>
    <#if resultList?has_content >
	<table id="dataTable" class="basic-table">
		<thead>
			<tr>
				<th>Question</th>
				<th>Rating</th>
				<th>Comment</th>
				<th>Proof</th>
				<th>Approver Name</th>
			</tr>
		</thead>
		<tbody>
			<#list resultList as resultList>
				<tr>
					<td>${resultList.question!}</td>
					<td>${resultList.rating!}</td>
					<td>${resultList.comment!}</td>
					<td><image src="data:image/png;base64,${resultList.proof!}" height="250px" width="250px" content-height="scale-to-fit" /></td>
					<td>${resultList.approve!}</td>
				</tr>
			</#list>
		</tbody>
	</table>
    <#else>
        
    </#if>
    <button id="dwnldBtn">
    Download Excel Sheet
</button>
</div>

<script>
        function exportTableToExcel() {
    const wb = XLSX.utils.book_new(); // Create a new workbook
    const ws = XLSX.utils.table_to_sheet(document.getElementById("dataTable"));

    // Add the sheet to the workbook
    XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
    const today = new Date();
    const dateOnly = today.toLocaleDateString();
    // Export the workbook
    XLSX.writeFile(wb, "dateOnly.xlsx");
}
document.getElementById("dwnldBtn").addEventListener("click", exportTableToExcel);

        console.log("i am here");
</script>