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
    table {
      width: 100%;
      margin-top: 30px;
      border-collapse: collapse;
    }
    th, td {
      padding: 12px;
      border: 1px solid #ddd;
    }
    th {
      background-color: #f1f1f1;
    }
  </style>

  <div class="container">
  <h2>Inventory Management</h2>
  <form id="inventoryForm">
    <div class="form-group">
      <label for="itemName">Item Name:</label>
      <input type="text" id="itemName" required>
    </div>
    <div class="form-group">
      <label for="itemCategory">Item Category:</label>
      <select id="itemCategory" required>
        <option value="">Select</option>
        <option>Feed</option>
        <option>Medicine</option>
        <option>Vaccine</option>
        <option>Equipment</option>
        <option>Others</option>
      </select>
    </div>
    <div class="form-group">
      <label for="unit">Unit:</label>
      <select id="unit" required>
        <option value="">Select</option>
        <option>Kg</option>
        <option>Litre</option>
        <option>Pieces</option>
      </select>
    </div>
    <div class="form-group">
      <label for="quantity">Quantity in Stock:</label>
      <input type="number" id="quantity" required>
    </div>
    <div class="form-group">
      <label for="reorder">Reorder Level:</label>
      <input type="number" id="reorder">
    </div>
    <div class="form-group">
      <label for="supplier">Supplier Name:</label>
      <input type="text" id="supplier">
    </div>
    <div class="form-group">
      <label for="purchaseDate">Purchase Date:</label>
      <input type="date" id="purchaseDate">
    </div>
    <div class="form-group">
      <label for="expiryDate">Expiry Date:</label>
      <input type="date" id="expiryDate">
    </div>
    <div class="form-group">
      <label for="remarks">Remarks:</label>
      <textarea id="remarks"></textarea>
    </div>
    <button type="submit">Save Inventory Item</button>
  </form>

  <table id="inventoryTable">
    <thead>
      <tr>
        <th>Item</th>
        <th>Category</th>
        <th>Unit</th>
        <th>Qty</th>
        <th>Reorder</th>
        <th>Supplier</th>
        <th>Purchase</th>
        <th>Expiry</th>
      </tr>
    </thead>
    <tbody>
      <!-- Dynamic rows will be added here -->
    </tbody>
  </table>
</div>
