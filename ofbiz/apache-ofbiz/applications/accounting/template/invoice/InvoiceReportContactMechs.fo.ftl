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
<fo:table table-layout="fixed" width="100%" space-after="0.3in">
   <fo:table-column column-width="3.9in"/>
   <fo:table-column column-width="3.9in"/>
    <fo:table-body>
      <fo:table-row >
        <fo:table-cell>
          <fo:block visibility="hidden">_______________________________</fo:block>
      </fo:table-cell>
       
    </fo:table-row>
    
      <fo:table-row border="1pt solid black"  >
        <fo:table-cell padding="9px">
          <fo:block>${uiLabelMap.CommonTo}: </fo:block>
            <#if billingAddress??>
                <#assign billToPartyNameResult = dispatcher.runSync("getPartyNameForDate", Static["org.apache.ofbiz.base.util.UtilMisc"].toMap("partyId", billToParty.partyId, "compareDate", invoice.invoiceDate, "userLogin", userLogin))/>
                <fo:block>${billToPartyNameResult.fullName?default(billingAddress.toName)?default("Billing Name Not Found")}</fo:block>
                ${setContextField("postalAddress", billingAddress)}
                ${screens.render("component://party/widget/partymgr/PartyScreens.xml#postalAddressPdfFormatter")}
                <#if billToPartyTaxId?has_content>
                    <fo:block>${uiLabelMap.PartyTaxId}: ${billToPartyTaxId}</fo:block>
                </#if>
            <#else>
                <fo:block>${uiLabelMap.AccountingNoGenBilAddressFound}${billToParty.partyId}</fo:block>
            </#if>
       </fo:table-cell>
        <fo:table-cell>
            <#if shippingAddress??>
                <fo:block>${uiLabelMap.OrderShipTo}: </fo:block>
                ${setContextField("postalAddress", shippingAddress)}
                ${screens.render("component://party/widget/partymgr/PartyScreens.xml#postalAddressPdfFormatter")}
            <#else>
                <fo:block/>
            </#if>
       </fo:table-cell>

    </fo:table-row>
  </fo:table-body>
</fo:table>
</#escape>
