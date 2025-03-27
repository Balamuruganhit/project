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

<fo:table table-layout="fixed" width="100%" border="1pt solid black" padding="10pt">
    <fo:table-body>
        <fo:table-row>
            <!-- First Column (Company Info) -->
            <fo:table-cell padding="5pt">
                <fo:block text-align="left">
                    <#if logoImageUrl?has_content>
                        <fo:external-graphic src="<@ofbizContentUrl>${logoImageUrl}</@ofbizContentUrl>" 
                            overflow="hidden" height="40px" content-height="scale-to-fit" content-width="2.00in"/>
                    </#if>
                </fo:block>

                <fo:block font-size="8pt">
                    <fo:block font-weight="bold">${companyName}</fo:block>
                    <#if postalAddress??>
                        <#if postalAddress?has_content>
                            ${setContextField("postalAddress", postalAddress)}
                            ${screens.render("component://party/widget/partymgr/PartyScreens.xml#postalAddressPdfFormatter")}
                        </#if>
                    <#else>
                        <fo:block>${uiLabelMap.CommonNoPostalAddress}</fo:block>
                        <fo:block>${uiLabelMap.CommonFor}: ${companyName}</fo:block>
                    </#if>

                    <#if sendingPartyTaxId?? || phone?? || email?? || website?? || eftAccount??>
                        <#if sendingPartyTaxId??>
                            <fo:block>${uiLabelMap.PartyTaxId}: ${sendingPartyTaxId}</fo:block>
                        </#if>
                        <#if phone??>
                            <fo:block>${uiLabelMap.CommonTelephoneAbbr}: 
                                <#if phone.countryCode??>${phone.countryCode}-</#if>
                                <#if phone.areaCode??>${phone.areaCode}-</#if>
                                ${phone.contactNumber!}
                            </fo:block>
                        </#if>
                        <#if email??>
                            <fo:block>${uiLabelMap.CommonEmail}: ${email.infoString!}</fo:block>
                        </#if>
                        <#if website??>
                            <fo:block>${uiLabelMap.CommonWebsite}: ${website.infoString!}</fo:block>
                        </#if>
                    </#if>
                </fo:block>
            </fo:table-cell>

            <!-- Second Column (Order Details) -->
            
        </fo:table-row>
    </fo:table-body>
</fo:table>

</#escape>
