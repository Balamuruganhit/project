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
        <fo:block font-weight="bold" font-size="15pt" space-before="0.2in" text-align="center">QUOTATION </fo:block>
        <fo:block font-weight="bold"  font-size="12pt" space-before="0.1in"  text-align="center">${(quoteType.get("description",locale))?default(quote.quoteTypeId!)}</fo:block>
        <fo:table table-layout="fixed" width="80%"   >
            <fo:table-column column-width="3.75in"/>
            <fo:table-column column-width="3.83in"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell  padding="10pt">
                        <fo:block >
                            <fo:block > </fo:block>
                            <#if quote.partyId??>
                                <#assign quotePartyNameResult = dispatcher.runSync("getPartyNameForDate", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("partyId", quote.partyId, "compareDate", quote.issueDate, "userLogin", userLogin))/>
                                <fo:block font-weight="bold">${quotePartyNameResult.fullName?default("[${uiLabelMap.OrderPartyNameNotFound}]")}</fo:block>
                                <fo:block font-size="10pt">
                            <#if toPostalAddress??>
                                ${setContextField("postalAddress", toPostalAddress)}
                                ${screens.render("component://party/widget/partymgr/PartyScreens.xml#postalAddressPdfFormatter")}
                            </#if>
                        </fo:block>
                            <#else>
                                <fo:block>[${uiLabelMap.OrderPartyNameNotFound}]</fo:block>
                            </#if>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                
            </fo:table-body>
        </fo:table>


        <fo:table table-layout="fixed"  space-before="0.1in"  font-size="9pt">
            <fo:table-column column-width="1.5in"/>
            <fo:table-column column-width="2.3in"/>
            
            <fo:table-body>
                
                
                <fo:table-row>
                    
                    <fo:table-cell  padding="6.8pt"><fo:block>Due Date :</fo:block></fo:table-cell>
                    <fo:table-cell  padding="6.8pt"><fo:block>${(quote.validThruDate?string("dd/MM/yyyy"))!}</fo:block></fo:table-cell>
                </fo:table-row>
                
                <#--  <fo:table-row>
                    <fo:table-cell border="1pt solid black" padding="6.8pt"><fo:block>${uiLabelMap.CommonQuoteTerms}:</fo:block></fo:table-cell>
                    <#assign quoteLevelTerms = Static["org.apache.ofbiz.entity.util.EntityUtil"].filterByAnd(quoteTerms, {"quoteItemSeqId": "_NA_"})!>
                    <#if quoteLevelTerms?has_content && quoteLevelTerms.size() gt 0>
                        <fo:table-cell border="1pt solid black" padding="6.8pt">
                            <#list quoteLevelTerms as quoteLevelTerm>
                                <fo:block>
                                    ${quoteLevelTerm.getRelatedOne("TermType", false).get("description",locale)} ${quoteLevelTerm.termValue?default("")} ${quoteLevelTerm.termDays?default("")} ${quoteLevelTerm.textValue?default("")}
                                </fo:block>
                            </#list>
                        </fo:table-cell>
                    </#if>
                </fo:table-row>  -->
            </fo:table-body>
        </fo:table>
        <fo:table table-layout="fixed"   space-after="0.3in" font-size="9pt">
            
            <fo:table-column column-width="7.10in"/>
            
            <fo:table-body>
                <fo:table-row >
                   
                    <fo:table-cell  padding="6.8pt"><fo:block>${quote.description!}</fo:block></fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
</#escape>
