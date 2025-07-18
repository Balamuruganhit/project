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
<#escape x as x?xml>
<#if productionRunData?has_content >
    <fo:table table-layout="fixed" border="1pt solid" padding="5pt" border-width=".1mm" >
        <fo:table-body>
            <fo:table-row >
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block padding="3.4pt">Customer Name:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                        <#if customer?has_content>
                            <fo:block number-columns-spanned="3" >${customer}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>PO No / SO No:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            
                            <#if order?has_content>
                                <fo:block>${order}</fo:block>
                            <#else>
                                <fo:block></fo:block>
                            </#if>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Date:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                        <#if orderDate?has_content>
                            <fo:block>${orderDate}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
            </fo:table-row>
             <fo:table-row >
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Product ID:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><#if productionRunData.productId?has_content>
                            <fo:block number-columns-spanned="3">${productionRunData.productId}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>WO No:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                                 <#if workOrderNumber?has_content>
                                <fo:block number-columns-spanned="3">${workOrderNumber}</fo:block>
                            <#else>
                                <fo:block></fo:block>
                            </#if>
                                
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Date:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <#if workDate?has_content>
                                <fo:block number-columns-spanned="3">${workDate}</fo:block>
                            <#else>
                                <fo:block></fo:block>
                            </#if>
                        </fo:table-cell>
            </fo:table-row>
            <fo:table-row >
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Product Name:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><#if product.internalName?has_content>
                            <fo:block number-columns-spanned="3">${product.internalName}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Product Description:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" number-columns-spanned="3">
                            
                            <#if product.description?has_content>
                                <fo:block >${product.description}</fo:block>
                            <#else>
                                <fo:block number-columns-spanned="3"></fo:block>
                            </#if>
                        </fo:table-cell>
            </fo:table-row>
            <fo:table-row >
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Production Run / Batch Quantity:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><#if quantity?has_content>
                            <fo:block number-columns-spanned="3">${quantity}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Production Run Description</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" number-columns-spanned="3">
                            
                            <#if productionRunData.description?has_content>
                                <fo:block  padding="3.4pt">${productionRunData.description}</fo:block>
                            <#else>
                                <fo:block ></fo:block>
                            </#if>
                        </fo:table-cell>
                        
            </fo:table-row>
            <fo:table-row >
                        <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt"><fo:block>Expected Completion/Delivery Date:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><#if productionRunData.estimatedCompletionDate?has_content>
                            <fo:block number-columns-spanned="3" >${productionRunData.estimatedCompletionDate}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                        <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt"><fo:block>Product Type:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" number-columns-spanned="3">
                            
                            <#if productType?has_content>
                                <fo:block number-columns-spanned="3">${productType}</fo:block>
                            <#else>
                                <fo:block></fo:block>
                            </#if>
                        </fo:table-cell>
            </fo:table-row>
        </fo:table-body>
    </fo:table>
    <fo:table border="1pt solid black" padding="5pt" table-layout="fixed">
        <fo:table-header>
            <fo:table-row font-weight="bold" >
                <fo:table-cell number-columns-spanned="4" border="1pt solid black" padding="7pt" text-align="center" background-color="#808080"><fo:block>RAW MATERIAL</fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-header>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>Sl No</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>Material</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>Grade/Description</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>Qty</fo:block></fo:table-cell>
            </fo:table-row>
             <#list productionRunComponents as component>
                <#list 1..lengthProduction as i>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${i}</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${component.productId}</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block></fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${component.estimatedQuantity}</fo:block></fo:table-cell>
                    </fo:table-row>
                </#list>
             </#list>
        </fo:table-body>
    </fo:table>
    <fo:table border="1pt solid black" padding="5pt" table-layout="fixed">
        <fo:table-header>
            <fo:table-row font-weight="bold">
                <fo:table-cell border="1pt solid black" padding="7pt" text-align="center" background-color="#808080" number-columns-spanned="9"><fo:block>ROUTING TASKS</fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-header>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>OPERATIONS</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>MACHINE</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>OPERATOR</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>DATE</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>ESTIMATED SETUP TIME</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>ESTIMATD RUN TIME</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>ACTUAL SETUP TIME</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>ACTUAL RUN TIME</fo:block></fo:table-cell>
                <fo:table-cell font-weight="bold" border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>QC Remarks</fo:block></fo:table-cell>
            </fo:table-row>
            <#list productionRunRoutingTasks as taskDetail>
                <fo:table-row>
                    <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center"><fo:block>${taskDetail.workEffortName}</fo:block></fo:table-cell>
                     <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center">
                        <fo:block wrap-option="wrap" linefeed-treatment="preserve" white-space-collapse="false">
  ${taskDetail.fixedAssetId!""}
</fo:block>
                     </fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center"><#if taskDetail.reservPersons?has_content>
                            <fo:block >${taskDetail.reservPersons}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                    <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center">
                        <#if taskDetail.estimatedStartDate?has_content>
                            <fo:block >${taskDetail.estimatedStartDate}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if>
                    </fo:table-cell>
                    <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center">
                        <#if taskDetail.estimatedSetupMillis?has_content>
                            <fo:block >${taskDetail.estimatedSetupMillis}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if>
                    </fo:table-cell>
                    <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center">
                        <#if taskDetail.estimatedSetupMillis?has_content>
                            <fo:block >${taskDetail.estimatedSetupMillis * quantity}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                    <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center">
                        <#if taskDetail.estimatedSetupMillis?has_content>
                            <fo:block >${taskDetail.estimatedSetupMillis}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if>
                    </fo:table-cell>
                    <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center">
                        <#if taskDetail.estimatedSetupMillis?has_content>
                            <fo:block >${taskDetail.estimatedSetupMillis * quantity}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if>
                    </fo:table-cell>
                    <fo:table-cell border="1pt solid black" padding="3.4pt" text-align="center"><fo:block></fo:block></fo:table-cell>
                </fo:table-row>
            </#list>
        </fo:table-body>
    </fo:table>
    <fo:table border="1pt solid black" padding="5pt" table-layout="fixed">
        <fo:table-header>
            <fo:table-row font-weight="bold">
                <fo:table-cell border="1pt solid black" padding="7pt" text-align="center" background-color="#808080" number-columns-spanned="9"><fo:block>EXTERNAL SERVICES</fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-header>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>Sl No</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>VENDOR</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>OPERATION</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>MACHINE</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>DATE</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>TIME (FROM)</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>TIME (TO)</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>Total Time</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold"  padding="3.4pt" text-align="center"><fo:block>PRICE (PER PIECE)</fo:block></fo:table-cell>
            </fo:table-row>
            <fo:table-row>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
            </fo:table-row>
            <fo:table-row>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
            </fo:table-row>
            <fo:table-row>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-body>
    </fo:table>
    <fo:table border="1pt solid black" padding="5pt" table-layout="fixed">
        <fo:table-header>
            <fo:table-row>
                <fo:table-cell border="1pt solid black" font-weight="bold" padding="7pt" text-align="center" background-color="#808080" number-columns-spanned="6"><fo:block>FINAL DETAILS</fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-header>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Date of Completion:</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="3.4pt"><#if completionProduction?has_content>
                            <fo:block >${completionProduction}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold" number-columns-spanned="2" text-align="center" padding="3pt" number-rows-spanned="3"><fo:block>REMARKS/SPECIAL INSTRUCTIONS:</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" number-columns-spanned="2" number-rows-spanned="3"><fo:block></fo:block></fo:table-cell>
            </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Date of Final Inspection:</fo:block></fo:table-cell>
                        <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" ><fo:block></fo:block></fo:table-cell> 
                    </fo:table-row>
           <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Inventory No and Date:</fo:block></fo:table-cell>
                        <#list inventoryItems as inventoryItem>
                            <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${inventoryItem.inventoryItemId} - ${invDate}</fo:block></fo:table-cell>
                        </#list>
                    </fo:table-row>
                             
        </fo:table-body>
    </fo:table>
    <fo:table border="1pt solid black" padding="5pt" table-layout="fixed">
        
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
                <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" height="1cm"><fo:block></fo:block></fo:table-cell>
            </fo:table-row>
             <fo:table-row>
                <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold" text-align="center"><fo:block>ISSUED BY</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold" text-align="center"><fo:block>PRODUCTION ENGINEER</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold" text-align="center"><fo:block>QC MANAGER</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold" text-align="center"><fo:block>PRODUCTION MANAGER</fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-body>
    </fo:table>
</#if>
</#escape>