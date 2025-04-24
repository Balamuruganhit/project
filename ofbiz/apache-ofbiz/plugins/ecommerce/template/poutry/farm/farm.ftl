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
.main-container{
    display:flex;
    flex-direction:row; 
}
    .container {
      background: white;
      width: 500px;
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
    .heighter{
        height:21rem;
    }
    .chart-wrapper {
      max-width: 100%;
      overflow-x: auto;
      padding: 20px;
    }

    .chart {
      display: flex;
      align-items: flex-end;
      gap: 10px;
      height: 40vh; /* Responsive height */
      min-width: 400px;
      border-left: 2px solid #444;
      border-bottom: 2px solid #444;
      padding: 20px 10px 0 10px;
    }

    .bar-container {
      flex: 1;
      min-width: 60px;
      display: flex;
      flex-direction: column;
      align-items: center;
      position: relative;
    }

    .bar {
      width: 100%;
      background: linear-gradient(to top, #38bdf8, #0ea5e9);
      display: flex;
      justify-content: center;
      align-items: flex-end;
      border-radius: 8px 8px 0 0;
      transition: 0.3s ease;
      position: relative;
    }

    .bar span {
      color: white;
      font-size: 12px;
      padding: 5px;
    }

    .bar:hover {
      opacity: 0.8;
      cursor: pointer;
    }

    .tooltip {
      visibility: hidden;
      background-color: #333;
      color: #fff;
      text-align: center;
      padding: 5px 10px;
      border-radius: 6px;
      position: absolute;
      bottom: 110%;
      z-index: 1;
      font-size: 12px;
      opacity: 0;
      transition: opacity 0.3s;
      white-space: nowrap;
    }

    .bar-container:hover .tooltip {
      visibility: visible;
      opacity: 1;
    }

    .label {
      margin-top: 10px;
      font-size: 14px;
      font-weight: bold;
    }

    @media (max-width: 600px) {
      .chart {
        height: 300px;
        gap: 6px;
      }
      .bar-container {
        min-width: 40px;
      }
      .label {
        font-size: 12px;
      }
    }
  </style>
<div class="container">
  <label for="quantity">Total Stock of Chicken</label>
<label for="quantity">${stockMessage}</label>
</div>
<br/>
<br/>
<#assign maxHeight = 700>
<#assign maxQuantity = 200>
<div class="container " style="width:auto">
  <h2 style="text-align: center;">Sales Over Dates (Hover to See Chick No)</h2>
  <div class="chart">
    <#list statics as item>
    <#assign scaledHeight = (item.quantity?number / maxQuantity) * maxHeight>
        <div class="bar-container">
          <div class="tooltip">Chick No: ${item.quantity}</div>
          <div class="bar" style="height:${scaledHeight?int}px;"><span>${item.quantity}</span></div>
          <div class="label">
          ${item.createdStamp}</div>
        </div>
    </#list>
  </div>
</div>
<br/>
<div class="main-container">

<div class="container">
  <h2>Daily Sale Update</h2>
  <form id="orderForm" action="<@ofbizUrl>createfarm</@ofbizUrl>">
    <div class="form-group">
      <input type="text" name="indexer" value="chicken" hidden>
    </div>
    <div class="form-group">
      <input type="text" name="typeMonitor" value="sales" hidden>
    </div>
    <div class="form-group">
      <input type="text" name="productName" value="chicken" hidden>
    </div>
    <div class="form-group">
      <label for="quantity">Total sale Of Chicken:</label>
      <input type="number" name="itemCategory" required>
    </div>
    <div class="form-group">
      <label for="rate">Rate per Chicken:</label>
      <input type="number" name="rate" required>
    </div>
    <button type="submit">Update</button>
  </form>

</div>
<div class="container heighter">
  <h2>Daily Chech Death Update</h2>
  <form id="orderForm" action="<@ofbizUrl>createfarm</@ofbizUrl>">
    <div class="form-group">
      <input type="text" name="productName" value="chickenDeath" hidden>
    </div>
     <div class="form-group">
      <input type="text" name="indexer" value="chicken" hidden>
    </div>
    <div class="form-group">
      <input type="text" name="typeMonitor" value="death" hidden>
    </div>
    <div class="form-group">
      <label for="quantity">No of chick death:</label>
      <input type="number" name="itemCategory" required>
    </div>
    <button type="submit">Update</button>
  </form>

</div>
</div>