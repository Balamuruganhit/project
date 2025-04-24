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
  

  h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #343a40;
  }

  .card {
    border-radius: 12px;
    width:20rem;
    border: 1px solid #dee2e6;
    transition: transform 0.2s ease-in-out, box-shadow 0.2s;
    background-color: #ffffff; /* white background */
  }

  .card:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.08);
  }

  .card-title {
    font-weight: 600;
    font-size: 18px;
    color: #007bff;
  }

  .card-text {
    font-size: 14px;
    color: #495057;
  }

  .card-footer {
    background-color: transparent;
    border-top: none;
    display: flex;
    justify-content: flex-end;
    gap: 10px;
  }

  .btn-sm {
    font-size: 13px;
    padding: 4px 10px;
    border-radius: 20px;
  }

  .container {
    padding: 30px;
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
      </#if>
    </ul>
  </div>
</nav>

<h2 class="mb-4">Inventory Items</h2>

<#if inventoryList?has_content>
  <div class="row row-cols-1 flex  row-cols-md-3 g-4">
    <#list inventoryList as item>
      <div class="col">
        <div class="card h-100 shadow-sm border-0">
          <div class="card-body">
            <h5 class="card-title text-primary">Item : ${item.iname}</h5>
            <p class="card-text">
              <strong>Category:</strong> ${item.icategory}<br>
              <strong>Quantity:</strong>${item.iunit} ${item.istockLevel} <br>
              <strong>Location:</strong> ${item.isupplier}<br>
              <strong>Date Added:</strong> ${item.lastUpdatedTxStamp}
            </p>
          </div>
          
        </div>
      </div>
    </#list>
  </div>
<#else>
  <p>No inventory items available.</p>
</#if>
