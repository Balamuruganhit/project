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
<fo:block  visibility="hidden" font-size="8pt">I am ocuping space</fo:block>
<#if "PURCHASE_ORDER" == orderHeader.getString("orderTypeId")>
    <#if supplierGeneralContactMechValueMap??>
        <#assign contactMech = supplierGeneralContactMechValueMap.contactMech>
        <fo:block font-weight="bold" border="0.5pt solid black" padding="2pt" width="19cm">${uiLabelMap.OrderPurchasedFrom}:</fo:block>
        <#assign postalAddress = supplierGeneralContactMechValueMap.postalAddress>
        <#if postalAddress?has_content>
            <fo:block text-indent="0.2in" border="0.5pt solid black" padding="2pt">
                <#if postalAddress.toName?has_content><fo:block>${postalAddress.toName}</fo:block></#if>
                <#if postalAddress.attnName?has_content><fo:block>${postalAddress.attnName!}</fo:block></#if>
                <fo:block>${postalAddress.address1!}</fo:block>
                <#if postalAddress.address2?has_content><fo:block>${postalAddress.address2!}</fo:block></#if>
                <fo:block>
                    <#assign stateGeo = (delegator.findOne("Geo", {"geoId", postalAddress.stateProvinceGeoId!}, false))! />
                    ${postalAddress.city}<#if stateGeo?has_content>, ${stateGeo.geoName!}</#if> ${postalAddress.postalCode!}
                </fo:block>
                <fo:block>
                    <#assign countryGeo = (delegator.findOne("Geo", {"geoId", postalAddress.countryGeoId!}, false))! />
                    <#if countryGeo?has_content>${countryGeo.geoName!}</#if>
                </fo:block>
            </fo:block>                
        </#if>
    <#else>
        <#assign vendorParty = orderReadHelper.getBillFromParty()>
        <fo:block border="0.5pt solid black" padding="2pt">
            <fo:inline font-weight="bold">${uiLabelMap.OrderPurchasedFrom}:</fo:inline> ${Static['org.apache.ofbiz.party.party.PartyHelper'].getPartyName(vendorParty)}
        </fo:block>
    </#if>
</#if>

<#-- List all postal addresses of the order -->
<#list orderContactMechValueMaps as orderContactMechValueMap>
    <#assign contactMech = orderContactMechValueMap.contactMech>
    <#assign contactMechPurpose = orderContactMechValueMap.contactMechPurposeType>
    <#if "POSTAL_ADDRESS" == contactMech.contactMechTypeId>
        <#assign postalAddress = orderContactMechValueMap.postalAddress>
        <fo:block font-weight="bold" border="0.5pt solid black" padding="2pt">${contactMechPurpose.get("description",locale)}:</fo:block>
        <fo:block text-indent="0.2in" border="0.5pt solid black" padding="2pt">
            <#if postalAddress?has_content>
                <#if postalAddress.toName?has_content><fo:block>${postalAddress.toName!}</fo:block></#if>
                <#if postalAddress.attnName?has_content><fo:block>${postalAddress.attnName!}</fo:block></#if>
                <fo:block>${postalAddress.address1!}</fo:block>
                <#if postalAddress.address2?has_content><fo:block>${postalAddress.address2!}</fo:block></#if>
                <fo:block>
                    <#assign stateGeo = (delegator.findOne("Geo", {"geoId", postalAddress.stateProvinceGeoId!}, false))! />
                    ${postalAddress.city}<#if stateGeo?has_content>, ${stateGeo.geoName!}</#if> ${postalAddress.postalCode!}
                </fo:block>
                <fo:block>
                    <#assign countryGeo = (delegator.findOne("Geo", {"geoId", postalAddress.countryGeoId!}, false))! />
                    <#if countryGeo?has_content>${countryGeo.geoName!}</#if>
                </fo:block>
            </#if>
        </fo:block>
    </#if>
</#list>

<fo:block space-after="0.2in"/>

<#if orderPaymentPreferences?has_content>
    <fo:block font-weight="bold" border="0.5pt solid black" padding="2pt">${uiLabelMap.AccountingPaymentInformation}:</fo:block>
    <#list orderPaymentPreferences as orderPaymentPreference>
        <fo:block text-indent="0.2in" border="0.5pt solid black" padding="2pt">
            <#assign paymentMethodType = orderPaymentPreference.getRelatedOne("PaymentMethodType", false)!>
            <#if (orderPaymentPreference?? && ("CREDIT_CARD" == orderPaymentPreference.getString("paymentMethodTypeId")) && (orderPaymentPreference.getString("paymentMethodId")?has_content))>
                <#assign creditCard = orderPaymentPreference.getRelatedOne("PaymentMethod", false).getRelatedOne("CreditCard", false)>
                ${Static["org.apache.ofbiz.party.contact.ContactHelper"].formatCreditCard(creditCard)}
            <#else>
                ${paymentMethodType.get("description",locale)!}
            </#if>
        </fo:block>
    </#list>
</#if>

<#if "SALES_ORDER" == orderHeader.getString("orderTypeId") && shipGroups?has_content>
    <fo:block font-weight="bold" border="0.5pt solid black" padding="2pt" width="19cm">${uiLabelMap.OrderShipmentInformation}:</fo:block>
    <#list shipGroups as shipGroup>
        <fo:block text-indent="0.2in" border="0.5pt solid black" padding="2pt">
            <#if shipGroups.size() gt 1>${shipGroup.shipGroupSeqId} - </#if>
            <#if (shipGroup.shipmentMethodTypeId)??>
                ${(shipGroup.getRelatedOne("ShipmentMethodType", false).get("description", locale))?default(shipGroup.shipmentMethodTypeId)}
            </#if>
            <#if (shipGroup.shipAfterDate)?? || (shipGroup.shipByDate)??>
                <#if (shipGroup.shipAfterDate)??> - ${uiLabelMap.OrderShipAfterDate}: ${Static["org.apache.ofbiz.base.util.UtilDateTime"].toDateString(shipGroup.shipAfterDate)}</#if>
                <#if (shipGroup.shipByDate)??> - ${uiLabelMap.OrderShipBeforeDate}: ${Static["org.apache.ofbiz.base.util.UtilDateTime"].toDateString(shipGroup.shipByDate)}</#if>
            </#if>
        </fo:block>
    </#list>
</#if>

<#if orderTerms?has_content && orderTerms.size() gt 0>
    <fo:block font-weight="bold" border="0.5pt solid black" padding="2pt">${uiLabelMap.OrderOrderTerms}:</fo:block>
    <#list orderTerms as orderTerm>
        <fo:block text-indent="0.2in" border="0.5pt solid black" padding="2pt">
            ${orderTerm.getRelatedOne("TermType", false).get("description",locale)} ${orderTerm.termValue?default("")} ${orderTerm.termDays?default("")} ${orderTerm.textValue?default("")}
        </fo:block>
    </#list>
</#if>

</#escape>
