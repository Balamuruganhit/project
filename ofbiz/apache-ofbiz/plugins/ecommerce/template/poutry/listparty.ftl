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
<nav class="navbar navbar-expand-lg navbar-dark flex bg-primary mb-4">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarlist" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarlist">
        <ul class="navbar-nav ml-auto">
        <#if !userLogin?has_content || (userLogin.userLoginId)! != "anonymous">
            <li class="nav-item">
            <a class="nav-link" href="<@ofbizUrl>ListParty</@ofbizUrl>">List Party</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<@ofbizUrl>Party</@ofbizUrl>">AddParty</a>
            </li>
        </#if>
        </ul>
    </div>
</nav>
<h2 style="margin-bottom: 20px;">Party Details</h2>

<#if partyList?has_content>
  <div class="table-container">
    <table class="styled-table">
      <thead>
        <tr>
          <th>Party ID</th>
          <th>Type</th>
          <th>Name</th>
          <th>Phone</th>
          <th>Email</th>
          <th>Address</th>
          <th>Company</th>
        </tr>
      </thead>
      <tbody>
        <#list partyList as party>
          <tr>
            <td>${party.partyId}</td>
            <td>${party.partyType}</td>
            <td>${party.name}</td>
            <td>${party.phoneNo}</td>
            <td>${party.email}</td>
            <td>${party.address}</td>
            <td>${party.company}</td>
          </tr>
        </#list>
      </tbody>
    </table>
  </div>
<#else>
  <p>No party data found.</p>
</#if>

<style>
  .table-container {
    overflow-x: auto;
    margin-top: 20px;
  }

  .styled-table {
    width: 100%;
    border-collapse: collapse;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-size: 14px;
    min-width: 800px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    border-radius: 8px;
    overflow: hidden;
  }

  .styled-table thead tr {
    background-color: #2f4f4f;
    color: #ffffff;
    text-align: left;
  }

  .styled-table th, .styled-table td {
    padding: 12px 15px;
  }

  .styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
    background-color: #ffffff;
  }

  .styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
  }

  .styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #2f4f4f;
  }

  .styled-table tbody tr:hover {
    background-color: #e8f0fe;
    transition: background-color 0.2s ease-in-out;
  }
</style>
