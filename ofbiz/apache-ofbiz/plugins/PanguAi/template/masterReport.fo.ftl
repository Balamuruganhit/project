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


<fo:table table-layout="fixed"  border="1pt solid" padding="5pt" width="66cm" font-size="14pt" border-width=".1mm" >
        <fo:table-body>
            <fo:table-row >
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="2pt solid black" width="4cm" text-align="center" font-weight="bold"  padding="4pt" number-columns-spanned="8"><fo:block padding="4pt" ></fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="2pt solid black" width="4cm" text-align="center" font-weight="bold"  padding="4pt" number-columns-spanned="8"><fo:block padding="4pt" >Failure Rate</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="2pt solid black"  text-align="center" font-weight="bold" padding="4pt" number-columns-spanned="4"><fo:block padding="4pt" >Availability</fo:block></fo:table-cell>  
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="2pt solid black" font-weight="bold" padding="4pt" number-columns-spanned="3"><fo:block padding="4pt">Reliability</fo:block ></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="2pt solid black" width="4cm" text-align="center" font-weight="bold"  padding="4pt" number-columns-spanned="2"><fo:block padding="4pt"></fo:block></fo:table-cell>
            </fo:table-row>
            <fo:table-row >
                        <fo:table-cell  background-color="rgb(126, 187, 240)" border="1pt solid black"  text-align="center" font-weight="bold"  padding="4pt" width="10pt" number-columns-spanned="2"><fo:block padding="4pt" width="6cm">RAMS Num</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black"  text-align="center" font-weight="bold" padding="4pt"><fo:block padding="4pt">Date</fo:block></fo:table-cell>  
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Product Code:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Revision:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">System:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Sub System:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Sub Sub System:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Time period for observation (years)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">No of Failures observed:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Best Estimated of failure rate (per year)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Equiv MTBFs (hours)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">90% confidence interval - upper bound (per year)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Equiv MTBFs (hours)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">90% confidence interval - lower bound (per year)</fo:block></fo:table-cell>
                         <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Equiv MTBFs (hours)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Repair Time (hours)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Planned maintenance time hours per year</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Availability excl. planned mtce </fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Availability incl. planned mtce </fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Time period (years)</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Probability of no failures:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">Probability of one or more failures:</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black" text-align="center" font-weight="bold"  padding="4pt"><fo:block padding="4pt">RAMS Resp</fo:block></fo:table-cell>
                        <fo:table-cell background-color="rgb(126, 187, 240)" border="1pt solid black"  text-align="center" font-weight="bold" padding="4pt"><fo:block padding="4pt">Approver</fo:block></fo:table-cell>  
            </fo:table-row>
            <#list combinedRamsData as ramsData>
                <fo:table-row >
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" text-align="center" font-weight="bold"  padding="2pt" number-columns-spanned="2"><fo:block padding="4pt">${ramsData.header.ramsNo}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black"  text-align="center" font-weight="bold" padding="2pt"><fo:block padding="4pt">${ramsData.header.date}</fo:block></fo:table-cell>  
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${ramsData.header.product}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${ramsData.header.rev}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${ramsData.header.system}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${ramsData.header.sub}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${ramsData.header.subsub}</fo:block></fo:table-cell>
                            <#list ramsData.details as data>
                            <#if data.calculatorType == "empirical">
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.int1}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.int2}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out1}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out2}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out3}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out4}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out5}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out6}</fo:block></fo:table-cell>
                            <#elseif data.calculatorType == "availability" >
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.int1}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.int3}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out1} %</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out2} %</fo:block></fo:table-cell>
                            <#elseif data.calculatorType == "reliability" >
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.int1}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out1} %</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" font-weight="bold" padding="4pt"><fo:block padding="4pt">${data.out2} %</fo:block></fo:table-cell>
                            </#if>
                            </#list>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black" text-align="center" font-weight="bold"  padding="4pt"><fo:block padding="4pt">${ramsData.header.rams}</fo:block></fo:table-cell>
                            <fo:table-cell background-color="rgb(170, 185, 198)" border="1pt solid black"  text-align="center" font-weight="bold" padding="4pt"><fo:block padding="4pt">${ramsData.header.approver}</fo:block></fo:table-cell>  
                </fo:table-row> 
            </#list>  
        </fo:table-body>

    </fo:table>