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
            <a class="nav-link" href="<@ofbizUrl>ListOrder</@ofbizUrl>">List order History</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<@ofbizUrl>order</@ofbizUrl>">Create Order</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="<@ofbizUrl>quotation</@ofbizUrl>">Create Quotation</a>
            </li>
        </#if>
        </ul>
    </div>
</nav>

<style>
    .container {
      background: white;
      max-width: 900px;
      margin: auto;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      display: block;
      font-weight: bold;
    }
    input, select, textarea {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    button {
      margin-top: 10px;
      background: #28a745;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
    button:hover {
      background: #218838;
    }
    table {
      width: 100%;
      margin-top: 20px;
      border-collapse: collapse;
    }
    th, td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    th {
      background: #e9ecef;
    }
  </style>

<div class="container">
  <h2>Order Management</h2>
  <form id="orderForm">
    <div class="form-group" action="<@ofbizUrl>createOrder</@ofbizUrl>">
      <label for="orderDate">Order Date:</label>
      <input type="date" name="orderDate" required>
    </div>
    <div class="form-group">
      <label for="customerName">Customer / Vendor Name:</label>
      <#if partyName?has_content>
          <select name="supplier">
           <option>select</option>
          <#list partyName as party>
            <option>${party.name}</option>
          </#list>
          </select>
      </#if>
    </div>
    <div class="form-group">
      <label for="orderType">Order Type:</label>
      <select name="orderType" required>
        <option value="">Select</option>
        <option>Sales</option>
        <option>Purchase</option>
      </select>
    </div>
    <div class="form-group">
      <label for="productName">Product Name:</label>
      <input type="text" name="productName" required>
    </div>
    <div class="form-group">
      <label for="quantity">Quantity:</label>
      <input type="number" name="quantity" required>
    </div>
    <div class="form-group">
      <label for="unit">Unit:</label>
      <select name="unit" required>
        <option>kg</option>
        <option>pcs</option>
        <option>crate</option>
      </select>
    </div>
    <div class="form-group">
      <label for="rate">Rate per unit:</label>
      <input type="number" name="rate" required>
    </div>
    <button type="submit">Save Order</button>
  </form>

</div>