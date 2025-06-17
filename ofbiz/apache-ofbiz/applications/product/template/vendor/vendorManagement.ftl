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


<#-- Assign currentPartyId to check group change -->
<#assign currentPartyId = "">

<#-- Loop through vendorProductList set in context by the Groovy script -->
<#list vendorProductList as item>
    
  <#-- Check for new vendor row -->
  <#if item.rowType == "party">
    <#-- Close previous table if needed -->
    <#if currentPartyId != "">
      </tbody>
      </table>
      <hr/>
    </#if>

    <h1 style="color:#1e88e5">${item.partyName}</h1>
    <div style="margin-bottom: 10px;">
      <strong>Status:</strong> ${item.status} |
      <strong>Role:</strong> ${item.role} |
      <strong>Phone:</strong> ${item.contactNumber!""} |
      <strong>Email:</strong> ${item.email!""} |
      <strong>Website:</strong> ${item.website!""}
    </div>

    <table border="1" cellpadding="5" cellspacing="0" width="100%" style="border-collapse: collapse; font-size: 12px;">
      <thead style="background-color:#f2f2f2;">
        <tr >
          <th style="padding:10px;">Part No</th>
          <th style="padding:10px;">Part Name</th>
          <th style="padding:10px;">Product Type</th>
          <th style="padding:10px;">Dimensions</th>
          <th style="padding:10px;">UOM</th>
          <th style="padding:10px;">Quantity</th>
          <th style="padding:10px;">Price</th>
        </tr>
      </thead>
      <tbody>

    <#-- Update currentPartyId -->
    <#assign currentPartyId = item.partyId>
  
  <#-- Product row -->
  <#elseif item.rowType == "product">
    <tr>
      <td style="padding:10px;">${item.partNo}</td>
      <td style="padding:10px;">${item.partName}</td>
      <td style="padding:10px;">${item.productType}</td>
      <td style="padding:10px;">${item.dimensions!""}</td>
      <td style="padding:10px;">${item.uom!""}</td>
      <td style="padding:10px;">${item.quantity!" "}</td>
      <td style="padding:10px;">
        <#if item.price?has_content>
          ${item.price?string["0.00"]}
        <#else>
          -
        </#if>
      </td>
    </tr>
  </#if>

</#list>

<#-- Close last table if still open -->
<#if currentPartyId != "">
  </tbody>
  </table>
</#if>
