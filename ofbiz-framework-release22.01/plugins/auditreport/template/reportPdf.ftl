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
<table class="basic-table hover-bar">
    <thead>
        <tr class="header-row-2">
            <th>Report ID</th>
            <th>Question</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Proof</th>
            <th>Approver Name</th>
        </tr>
    </thead>
    <tbody>
		 <#list resultList as listOfReport>
		 	<td>${listOfReport.reportId!}</td>
            <td>${listOfReport.question!}</td>
            <td>${listOfReport.rating!}</td>
            <td>${listOfReport.comment!}</td>
            <td><img src="${listOfReport.image!}" alt="Proof" style="width: 50px; height: 50px;" /></td>
            <td>${listOfReport.approverName!}</td>
		 </#list>
	</tbody>
</table>