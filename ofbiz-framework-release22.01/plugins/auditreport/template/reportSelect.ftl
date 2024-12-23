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
<script src=
"https://code.jquery.com/jquery-3.6.4.min.js">
    </script>

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
	<table id="dataTable" class="basic-table light-grid hover-bar">
		<thead class="header-row-2">
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
                    <td>
                        <img 
                                src="data:image/png;base64,${resultList.proof!}" 
                                height="250px" 
                                width="250px" 
                                style="object-fit: scale-down;" 
                                alt="Proof Image" />
                    </td>
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
        $(document).ready(function () {
            $('#dwnldBtn').on('click', function () {
                downloadExcelTable('dataTable', 'employeeData');
            });

            function downloadExcelTable(tableID, filename = '') {
                const linkToDownloadFile = document.
                                           createElement("a");
                const fileType = 'application/vnd.ms-excel';
                const selectedTable = document.
                                      getElementById(tableID);
                const selectedTableHTML = selectedTable.outerHTML.
                                          replace(/ /g, '%20');

                filename = filename ? filename + '.xls' : 
                           'excel_data.xls';
                document.body.appendChild(linkToDownloadFile);

                if (navigator.msSaveOrOpenBlob) {
                    const myBlob = new Blob(['\ufeff',
                                   selectedTableHTML], {
                        type: fileType
                    });
                    navigator.msSaveOrOpenBlob(myBlob, filename);
                } else {
                    // Create a link to download
                    // the excel the file
                    linkToDownloadFile.href = 'data:' + fileType + 
                                               ', ' + selectedTableHTML;

                    // Setting the name of
                    // the downloaded file
                    linkToDownloadFile.download = filename;

                    // Clicking the download link 
                    // on click to the button
                    linkToDownloadFile.click();
                }
            }
        });
        console.log("i am here");
</script>