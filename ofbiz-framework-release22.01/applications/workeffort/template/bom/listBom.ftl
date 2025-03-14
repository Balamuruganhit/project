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

<#if resultList?has_content >
    <div class="screenlet">
    <div class="screenlet-title-bar">
        <ul>
        <li class="h3">${uiLabelMap.ListOfBom}</li>
        </ul>
        <br class="clear"/>
    </div>
    <div class="screenlet-body">
        <a name="components"></a>
        <table class="basic-table light-grid" cellspacing="0">
        <tr class="header-row-2">
            <td>Part Number</td>
            <td>Added Product</td>
            <td>${uiLabelMap.CommonFromDate}</td>
            <td>${uiLabelMap.CommonThruDate}</td>
            <td>${uiLabelMap.CommonQuantity}</td>
        </tr>
        <#assign alt_row = false>
        <#list resultList! as resultList>
        <tr valign="middle"<#if alt_row> class="alternate-row"</#if>>
            <td>&nbsp;${(resultList.ProductId)!}</td>
            <td>&nbsp;${(resultList.ProductIdTo)!}</td>
            <td>&nbsp; ${(resultList.fromDate)!}</td>
            <td>&nbsp;${(resultList.thruDate)!}</td>
            <td>&nbsp;${(resultList.quantity)!}</td>
        </tr>
        <#-- toggle the row color -->
        <#assign alt_row = !alt_row>
        </#list>
        </table>
    </div>
    </div>
<#else>
    <fo:block text-align="center">No BOM is created</fo:block>
</#if>