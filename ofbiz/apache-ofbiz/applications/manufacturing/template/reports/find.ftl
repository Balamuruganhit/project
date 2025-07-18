<!--
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

 <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 5px; text-align: left; }
        th { background-color: #f2f2f2; text-align:center; height:3rem; }
        .bolder{
            font-weight:bold;

        }
        .printButton{
            margin-top:4rem;
            height:2rem;
            width:7rem;
            padding:1rem;
            border-radius:16px;
        }
    </style>
    <table id="mytable">
 <table class="mytable">    

<#assign i=1/>
        <tr>
            <td class="bolder">Customer Name:</td>
            <#if customer?has_content>
                <td colspan="3">${customer}</td>
            <#else>
                <td colspan="3"></td>
            </#if>
            <td class="bolder">PO No / SO No:</td>
            <#if order?has_content>
                <td >${order}</td>
            <#else>
                <td style="width:6.5rem"></td>
            </#if>
            <td class="bolder">Date:</td>
            <#if orderDate?has_content>
                <td >${orderDate}</td>
            <#else>
                <td></td>
            </#if>
        </tr>
        <tr>
            <td class="bolder">Part ID:</td>
            <td colspan="3">${productionRunData.productId} </td>
            <td class="bolder">WO No:</td>
             <#if workOrderNumber?has_content>
                <td >${workOrderNumber}</td>
            <#else>
                <td ></td>
            </#if>
            <td class="bolder">Date:</td>
            <#if workDate?has_content>
                <td >${workDate}</td>
            <#else>
                <td ></td>
            </#if>
        </tr>
        <tr>
            <td class="bolder">Part Name:</td>
            <td colspan="3">${product.internalName}</td>
            <td class="bolder">Part Description:</td>
            <#if product.description?has_content>
                <td >${product.description}</td>
            <#else>
                <td ></td>
            </#if>
            <td class="bolder">Drawing No:</td>
            <td >${product.productName!""}</td>
        </tr>
        <tr>
            <td class="bolder">Production Run / Batch Quantity to be Produced:</td>
            <td colspan="3">${quantity}</td>
            <td class="bolder">Production Run Description:</td>
            <#if productionRunData.description? has_content>
            <td>${productionRunData.description}</td>
            <#else>
            <td ></td>
            </#if>
            <td class="bolder">Production Run No:</td>
            <td >${productionRunData.productionRunId}</td>
        </tr>
        <tr>
            <td class="bolder">Expected Completion/Delivery Date:</td>
            <td colspan="3">${productionRunData.estimatedCompletionDate}</td>
            <td class="bolder">Product Type:</td>
            <#if productType?has_content>
                <td colspan="3">${productType}</td>
            <#else>
                <td colspan="3"></td>
            </#if>
        </tr>

    </table>
    <h1></h1>
    <table class="mytable">
        <tr>
            <th colspan="5">RAW MATERIAL</th>
        </tr>
        <tr>
            <th>Sl No</th>
            <th>Part No</th>
            <th>Part Name</th>
            <th>Grade/Description</th>
            <th>Qty</th>
        </tr>
        <#list productionRunComponents as component>
            <#assign product = delegator.findOne("Product", {"productId": component.productId}, false)>
            <tr>
                <td>${i}</td>
                <td>${component.productId}</td>
                <td>${product.internalName}</td>
                <td><input/></td>
                <td>${component.estimatedQuantity}</td>
            </tr>
          <#assign i++/> 
        </#list>
    </table>
    <h1></h1>
    <table class="mytable">
        <tr>
            <th colspan="10">ROUTING TASKS</th>
        </tr>
        <tr>
            <th>Seq No</th>
            <th>OPERATIONS</th>
            <th>MACHINE</th>
            <th>OPERATOR</th>
            <th>DATE</th>
            <th>ESTIMATED SETUP TIME </th>
            <th>ESTIMATD RUN TIME</th>
            <th>ACTUAL SETUP TIME</th>
            <th>ACTUAL RUN TIME</th>
            <th>QC Remarks</th>
        </tr>
        <#list productionRunRoutingTasks as taskDetail>
            <tr>
                <td>${taskDetail.priority}</td>
                <td>${taskDetail.workEffortName}</td>
                <#if taskDetail.fixedAssetId? has_content>
                    <td>${taskDetail.fixedAssetId}</td>
                <#else>
                    <td ></td>
                </#if>
                
                <#if taskDetail.reservPersons? has_content>
                    <td>${taskDetail.reservPersons}</td>
                <#else>
                    <td ></td>
                </#if>
                <td>${taskDetail.estimatedStartDate!0}</td>
                <td>${taskDetail.estimatedSetupMillis!0}</td>
                <td> ${(taskDetail.estimatedMilliSeconds!0) * quantity}</td>
                <td></td>
                <td></td>
                <td><input style="height: 3rem;border:none;"/></td>
            </tr>
        </#list>
    </table>
    <h1></h1>
    <table class="mytable">
        <tr>
            <th colspan="9" sty>EXTERNAL SERVICES</th>
        </tr>
        <tr>
            <th>Sl No</th>
            <th>VENDOR</th>
            <th>OPERATION</th>
            <th>MACHINE</th>
            <th>DATE</th>
            <th>TIME (FROM)</th>
            <th>TIME (TO)</th>
            <th>Total Time</th>
            <th>PRICE (PER PIECE)</th>
        </tr>
       <tr>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
        </tr>
        <tr>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
            <td><input type="text" style="width: 9rem;border:none;"></td>
        </tr>
       
    </table>
    <h1></h1>
    <table class="mytable">
        <tr>
            <th colspan="4" >FINAL DETAILS</th>
        </tr>
        <tr>
            <td colspan="1" class="bolder">Date of Completion:</td>
            <#if completionProduction?has_content>
                <td colspan="1">${completionProduction}</td>
            <#else>
                <td colspan="1" style="visibility: hidden;">23-11</td>
            </#if>
            <td rowspan="5" colspan="1" class="bolder">REMARKS/SPECIAL INSTRUCTIONS:</td>
            <td rowspan="5" colspan="1"><textarea style="height:7rem;border:none;"></textarea></td>
        </tr>
        <tr>
            <td class="bolder">Date of Final Inspection:</td>
            <td></td>
        </tr>
        <tr>
            <td class="bolder">Quantity Produced</td>
            <td>${productionRunData.quantityProduced!}</td>
        </tr>
        <tr>
            <td class="bolder">Quantity Rejected</td>
            <td>${productionRunData.quantityRejected!}</td>
        </tr>
        <tr>
            <td class="bolder"> Inventory No and Date:</td>
            <#list inventoryItems as inventoryItem>
                <td>${inventoryItem.inventoryItemId} - ${invDate}</td>
            </#list>
        </tr>
    </table>
    <table class="mytable">
         <tr>
            <td><input type="text" style="width:25rem;height:3rem;border:none;"></td>
            <td><input type="text" style="width:25rem;height:3rem;border:none;"></td>
            <td><input type="text" style="width:25rem;height:3rem;border:none;""></td>
            <td><input type="text" style="width:25rem;height:3rem;border:none;"></td>
        </tr>
        <tr>
            <th>ISSUED BY</th>
            <th>PRODUCTION ENGINEER</th>
            <th>QC MANAGER</th>
            <th>PRODUCTION MANAGER</th>
        </tr>
    </table>
</table>
<div class="printButton">
    <a href="Report.pdf?workEffort=${productionRunData.productionRunId}" ><button >Print Pdf</button></a>
</div>
