<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.
-->
<#escape x as x?xml>
    <#if orderHeader?has_content>
        <fo:table table-layout="fixed" border-spacing="3pt" border="1pt solid black">
            <fo:table-column column-width="3in"/>
            <fo:table-column column-width="1in"/>
            <fo:table-column column-width="1in"/>
            <fo:table-column column-width="1in"/>
            <fo:table-column column-width="1in"/>
            <fo:table-header>
                <fo:table-row background-color="#CCCCCC">
                    <fo:table-cell border="1pt solid black">
                        <fo:block font-weight="bold" text-align="left">${uiLabelMap.OrderProduct}</fo:block>
                    </fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell text-align="right" border="1pt solid black">
                        <fo:block font-weight="bold">${uiLabelMap.OrderQuantity}</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="right" border="1pt solid black">
                        <fo:block font-weight="bold">${uiLabelMap.OrderUnitList}</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="right" border="1pt solid black">
                        <fo:block font-weight="bold">${uiLabelMap.OrderSubTotal}</fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <#list orderItemList as orderItem>
                    <fo:table-row>
                        <fo:table-cell border="1pt solid black">
                            <fo:block text-align="left">
                                ${orderItem.productId?default("N/A")} - ${orderItem.itemDescription!}
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black">
                            <fo:block>
                                <#if "PURCHASE_ORDER" == orderHeader.orderTypeId>
                                    <#if internalImageUrl?has_content>
                                        <fo:external-graphic src="${internalImageUrl}" overflow="hidden" content-width="100"/>
                                    </#if>
                                </#if>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" border="1pt solid black">
                            <fo:block>${remainingQuantity}</fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" border="1pt solid black">
                            <fo:block><@ofbizCurrency amount=orderItem.unitPrice isoCode=currencyUomId/></fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" border="1pt solid black">
                            <fo:block>
                                <@ofbizCurrency amount=Static["org.apache.ofbiz.order.order.OrderReadHelper"].getOrderItemSubTotal(orderItem, orderAdjustments) isoCode=currencyUomId/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </#list>
            </fo:table-body>
        </fo:table>
    </#if>
</#escape>
