
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
      background: #fff;
      max-width: 800px;
      margin: auto;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
      text-align: center;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      font-weight: bold;
      display: block;
    }
    input, select, textarea {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    button {
      background-color: #007bff;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
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
          <a class="nav-link" href="<@ofbizUrl>ListInventory</@ofbizUrl>">List Inventory</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>inventory</@ofbizUrl>">Add Item </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>Updateinventory</@ofbizUrl>">Update Item </a>
        </li>
      </#if>
    </ul>
  </div>
</nav>
<div class="container">
  <h2>Inventory Management</h2>
  <form id="inventoryForm" action="<@ofbizUrl>updateInventory</@ofbizUrl>">
    <div class="form-group">
      <label for="itemName">Item Name:</label>
      <#if itemName?has_content>
          <select name="itemNameupdate">
           <option>select</option>
          <#list itemName as item>
            <option>${item.iname}</option>
          </#list>
          </select>
      </#if>
    </div>
    <div class="form-group">
      <label for="unit">Unit:</label>
      <select name="unit" required>
        <option value="">Select</option>
        <option>Kg</option>
        <option>Litre</option>
        <option>Pieces</option>
      </select>
    </div>
    <div class="form-group">
      <label for="quantity">Quantity :</label>
      <input type="number" name="quantity" required>
    </div>
    
    </div>
    <button type="submit">Update Inventory Item</button>
  </form>
</div>
