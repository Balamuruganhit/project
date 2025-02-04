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

<fo:table border="1pt solid black" table-layout="fixed" width="100%">
    <fo:table-body>

        <!-- Header Row -->
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="5pt" number-columns-spanned="2">
                <fo:block font-weight="bold">${orderHeader.getRelatedOne("OrderType", false).get("description", locale)}</fo:block>
            </fo:table-cell>
        </fo:table-row>

        <!-- Order Date & Order Number (Side by Side) -->
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="5pt">
                <fo:block font-weight="bold">${uiLabelMap.OrderDateOrdered}</fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="5pt">
                <#assign dateFormat = Static["java.text.DateFormat"].LONG>
                <#assign orderDate = Static["java.text.DateFormat"].getDateInstance(dateFormat,locale).format(orderHeader.get("orderDate"))>
                <fo:block>${orderDate}</fo:block>
            </fo:table-cell>
        </fo:table-row>

        <!-- Order Number Row -->
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="5pt">
                <fo:block font-weight="bold">${uiLabelMap.OrderOrder} ${uiLabelMap.CommonNbr}</fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="5pt">
                <fo:block>${orderId}</fo:block>
            </fo:table-cell>
        </fo:table-row>

        <!-- Order Status Row -->
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="5pt">
                <fo:block font-weight="bold">${uiLabelMap.OrderCurrentStatus}</fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="5pt">
                <fo:block font-weight="bold">${currentStatus.get("description",locale)}</fo:block>
            </fo:table-cell>
        </fo:table-row>

        <!-- Cancel Back Order Date (Conditional) -->
        <#if orderItem.cancelBackOrderDate??>
            <fo:table-row>
                <fo:table-cell border="1pt solid black" padding="5pt">
                    <fo:block font-weight="bold">${uiLabelMap.FormFieldTitle_cancelBackOrderDate}</fo:block>
                </fo:table-cell>
                <fo:table-cell border="1pt solid black" padding="5pt">
                    <#assign dateFormat = Static["java.text.DateFormat"].LONG>
                    <#assign cancelBackOrderDate = Static["java.text.DateFormat"].getDateInstance(dateFormat,locale).format(orderItem.get("cancelBackOrderDate"))>
                    <#if cancelBackOrderDate?has_content>
                        <fo:block>${cancelBackOrderDate}</fo:block>
                    </#if>
                </fo:table-cell>
            </fo:table-row>
        </#if>

        <!-- Vendor Information -->
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="5pt" number-columns-spanned="2">
                <fo:block font-weight="bold">${uiLabelMap.OrderPurchasedFrom}:</fo:block>
                <fo:block>
                    <#if postalAddress.toName?has_content>${postalAddress.toName}</#if>
                    <#if postalAddress.attnName?has_content>, ${postalAddress.attnName!}</#if>
                    , ${postalAddress.address1!}
                    <#if postalAddress.address2?has_content>, ${postalAddress.address2!}</#if>
                    , ${postalAddress.city}
                    <#assign stateGeo = (delegator.findOne("Geo", {"geoId", postalAddress.stateProvinceGeoId!}, false))! />
                    <#if stateGeo?has_content>, ${stateGeo.geoName!}</#if>
                    ${postalAddress.postalCode!}
                    <#assign countryGeo = (delegator.findOne("Geo", {"geoId", postalAddress.countryGeoId!}, false))! />
                    <#if countryGeo?has_content>, ${countryGeo.geoName!}</#if>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>

        <!-- Billing & Shipping Address (Side by Side) -->
        <fo:table-row>
            <fo:table-cell border="1pt solid black" padding="5pt" width="50%">
                <fo:block font-weight="bold">Billing Address:</fo:block>
                <fo:block>${billingAddress!}</fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid black" padding="5pt" width="50%">
                <fo:block font-weight="bold">Shipping Address:</fo:block>
                <fo:block>${shippingAddress!}</fo:block>
            </fo:table-cell>
        </fo:table-row>

        <!-- Payment Method -->
        <#if orderPaymentPreferences?has_content>
            <fo:table-row>
                <fo:table-cell border="1pt solid black" padding="5pt" number-columns-spanned="2">
                    <fo:block font-weight="bold">${uiLabelMap.AccountingPaymentInformation}:</fo:block>
                    <#list orderPaymentPreferences as orderPaymentPreference>
                        <fo:block text-indent="0.2in">
                            <#assign paymentMethodType = orderPaymentPreference.getRelatedOne("PaymentMethodType", false)!>
                            <#if orderPaymentPreference.getString("paymentMethodTypeId") == "CREDIT_CARD">
                                <#assign creditCard = orderPaymentPreference.getRelatedOne("PaymentMethod", false).getRelatedOne("CreditCard", false)!>
                                ${Static["org.apache.ofbiz.party.contact.ContactHelper"].formatCreditCard(creditCard)}
                            <#else>
                                ${paymentMethodType.get("description", locale)!}
                            </#if>
                        </fo:block>
                    </#list>
                </fo:table-cell>
            </fo:table-row>
        </#if>

        <!-- Order Terms -->
        <#if orderTerms?has_content && orderTerms.size() gt 0>
            <fo:table-row>
                <fo:table-cell border="1pt solid black" padding="5pt" number-columns-spanned="2">
                    <fo:block font-weight="bold">${uiLabelMap.OrderOrderTerms}:</fo:block>
                    <#list orderTerms as orderTerm>
                        <fo:block text-indent="0.2in">
                            ${orderTerm.getRelatedOne("TermType", false).get("description",locale)} 
                            ${orderTerm.termValue?default("")} ${orderTerm.termDays?default("")} 
                            ${orderTerm.textValue?default("")}
                        </fo:block>
                    </#list>
                </fo:table-cell>
            </fo:table-row>
        </#if>

    </fo:table-body>
</fo:table>


<fo:block space-after="0.2in"/>
</#escape>
