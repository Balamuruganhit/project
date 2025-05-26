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
<style>
    .container {
      max-width: 800px;
      margin: auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      font-weight: bold;
      display: block;
      margin-bottom: 5px;
    }
    input, select, textarea {
      width: 100%;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
    }
    button {
      background: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      margin-top: 10px;
    }
    button:hover {
      background: #0056b3;
    }
    #partyList button {
      width: 100%;
      text-align: left;
      margin-top: 10px;
      background-color: #f8f9fa;
      color: #333;
    }
    #backBtn {
      background: #6c757d;
    }
    .hidden {
      display: none;
    }
    .party-card {
      border: 1px solid #ddd;
      padding: 10px;
      border-radius: 6px;
      margin-bottom: 10px;
      background-color: #f9f9f9;
    }
  </style>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
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
<div style="height:1rem"><div/>
<div class="container" id="formView">
  <h2>Add Party</h2>
 <form action="<@ofbizUrl>createParty</@ofbizUrl>">
    <div class="form-group">
      <label for="partyType">Party Type</label>
      <select id="partyType" name="partyType" required>
        <option value="">Select</option>
        <option value="Customer">Customer</option>
        <option value="Supplier">Supplier</option>
        <option value="Transporter">Transporter</option>
      </select>
    </div>
    <div class="form-group">
      <label for="partyName">Company Name</label>
      <input type="text" id="partyName" name="partyName" required>
    </div>
    <div class="form-group">
      <label for="contactPerson">Contact Person</label>
      <input type="text" id="contactPerson" name="contactPerson">
    </div>
    <div class="form-group">
      <label for="phone">Phone Number</label>
      <input type="tel" id="phone" name="phone" required>
    </div>
    <div class="form-group">
      <label for="email">Email Address</label>
      <input type="email" id="email" name="email">
    </div>
    <div class="form-group">
      <label for="address">Full Address</label>
      <textarea id="address" name="address" rows="3" required></textarea>
    </div>
    <button type="submit">Save Party</button>
  </form>
</div>

