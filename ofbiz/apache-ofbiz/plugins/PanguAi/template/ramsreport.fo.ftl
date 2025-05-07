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

<#escape x as x?xml>
    <#if ramsOutputTitle?has_content>
        <#--  <fo:table table-layout="fixed"  border="1pt solid" padding="5pt"   border-width=".1mm" >
            <fo:table-body>
                <fo:table-row >
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block padding="3.4pt">Rams No:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <fo:block number-columns-spanned="3" >${ramsOutputTitle.ramsNo}</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Product Code:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            
                            
                                <fo:block>${ramsOutputTitle.productCode}</fo:block>
                            
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Date:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <fo:block>${ramsOutputTitle.date}</fo:block>
                        </fo:table-cell>
            </fo:table-row>
            <fo:table-row >
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block padding="3.4pt">System:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <fo:block number-columns-spanned="3" >${ramsOutputTitle.system}</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Sub-System:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            
                            
                                <fo:block>${ramsOutputTitle.subsystem}</fo:block>
                            
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Sub-Sub-System:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <fo:block>${ramsOutputTitle.subsubsystem}</fo:block>
                        </fo:table-cell>
            </fo:table-row>
            <fo:table-row >
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block padding="3.4pt">RAMS Responsibility::</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <fo:block number-columns-spanned="3" >${ramsOutputTitle.rams}</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Team members:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            
                            
                                <fo:block>${ramsOutputTitle.team}</fo:block>
                            
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Approved by:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <fo:block>${ramsOutputTitle.approver}</fo:block>
                        </fo:table-cell>
            </fo:table-row>
            </fo:table-body>
        </fo:table>
        <fo:table border="1pt solid black" padding="5pt" table-layout="fixed">
        <fo:table-header>
            <fo:table-row font-weight="bold" >
                <fo:table-cell number-columns-spanned="4" border="1pt solid black" padding="7pt" text-align="center" background-color="#808080"><fo:block>Empirical Failure Rate</fo:block></fo:table-cell>
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
            <fo:table-row>
                <fo:table-cell border="1pt solid black" font-weight="bold" padding="7pt" text-align="center" background-color="#808080" number-columns-spanned="6"><fo:block>Empirical Failure Rate</fo:block></fo:table-cell>
            </fo:table-row>
        </fo:table-header>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Time period for observations (years):</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="3.4pt"><#if completionProduction?has_content>
                            <fo:block >${completionProduction}</fo:block>
                        <#else>
                            <fo:block></fo:block>
                        </#if></fo:table-cell>
                <fo:table-cell border="1pt solid black" font-weight="bold" number-columns-spanned="2" text-align="center" padding="3pt" number-rows-spanned="3"><fo:block>REMARKS/SPECIAL INSTRUCTIONS:</fo:block></fo:table-cell>
                <fo:table-cell border="1pt solid black" number-columns-spanned="2" number-rows-spanned="3"><fo:block></fo:block></fo:table-cell>
            </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Number of failures observed:</fo:block></fo:table-cell>
                        <fo:table-cell padding="3.4pt" text-align="center" border="1pt solid black" ><fo:block></fo:block></fo:table-cell> 
                    </fo:table-row>
           <fo:table-row>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" font-weight="bold"><fo:block>Inventory No and Date:</fo:block></fo:table-cell>
                        <#list inventoryItems as inventoryItem>
                            <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${inventoryItem.inventoryItemId} - ${invDate}</fo:block></fo:table-cell>
                        </#list>
                    </fo:table-row>
                             
        </fo:table-body>
    </fo:table>  -->
    <fo:block font-size="20pt">Under Maintenance</fo:block>
    </#if>
</#escape>