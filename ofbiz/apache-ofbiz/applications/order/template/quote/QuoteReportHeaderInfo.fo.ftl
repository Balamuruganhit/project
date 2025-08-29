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

<fo:list-block provisional-distance-between-starts="35mm" font-size="9pt">
    <fo:list-item >
        <fo:list-item-label>
            <fo:block font-weight="bold" border="1pt solid black" padding="6.3pt" border-bottom="0pt">Quote Number</fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
            <#--  <fo:block font-weight="bold" border="1pt solid black" padding="6.3pt">${(quoteType.get("description",locale))?default(quote.quoteTypeId!)}</fo:block>  -->
            <fo:block font-weight="bold" border="1pt solid black" padding="6.3pt" border-bottom="0pt">${quote.quoteId}</fo:block>

        </fo:list-item-body>
    </fo:list-item>
    <fo:list-item>
        <fo:list-item-label>
            <fo:block border="1pt solid black" padding="6.3pt" border-bottom="0pt">${uiLabelMap.OrderOrderQuoteIssueDate}</fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
            <fo:block border="1pt solid black" padding="6.3pt" border-bottom="0pt">${(quote.issueDate?string("dd/MM/yyyy"))!}</fo:block>
        </fo:list-item-body>
    </fo:list-item>
    <fo:list-item>
        <fo:list-item-label>
            <fo:block border="1pt solid black" padding="6.3pt" border-bottom="0pt">Reference Number</fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
            <fo:block border="1pt solid black"  <#if quote.referenceId?has_content>padding="6.3pt" border-bottom="0pt"<#else>padding="6.3pt" padding-bottom="16.3pt" border-bottom="0pt"</#if>>${quote.referenceId!""}</fo:block>
        </fo:list-item-body>
    </fo:list-item>
    <fo:list-item>
        <fo:list-item-label>
            <fo:block border="1pt solid black" padding="6.3pt">Reference Date</fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
            <#--  <fo:block font-weight="bold" border="1pt solid black" padding="6.3pt">${(statusItem.get("description", locale))?default(quote.statusId!)}</fo:block>  -->
             <fo:block font-weight="bold" border="1pt solid black"  <#if quote.referenceDate?has_content>padding="6.3pt" border-bottom="0pt"<#else>padding="6.3pt" padding-bottom="16.3pt" border-bottom="0pt"</#if>>${(quote.referenceDate?string("dd/MM/yyyy"))!}</fo:block>
        </fo:list-item-body>
    </fo:list-item>
</fo:list-block>
</#escape>
