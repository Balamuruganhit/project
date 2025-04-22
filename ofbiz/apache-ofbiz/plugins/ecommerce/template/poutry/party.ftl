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
<div class="container" id="formView">
  <h2>Add Party</h2>
 <form>
    <div class="form-group">
      <label for="partyType">Party Type</label>
      <select id="partyType" name="partyType" required>
        <option value="">Select</option>
        <option value="Customer">Customer</option>
        <option value="Supplier">Supplier</option>
        <option value="Employee">Employee</option>
        <option value="Veterinarian">Veterinarian</option>
        <option value="Transporter">Transporter</option>
      </select>
    </div>
    <div class="form-group">
      <label for="partyName">Full Name / Company Name</label>
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
    <div class="form-group">
      <label for="govtId">Government ID</label>
      <input type="text" id="govtId" name="govtId">
    </div>
    <div class="form-group">
      <label for="bankDetails">Bank Details (Optional)</label>
      <textarea id="bankDetails" name="bankDetails" rows="2" placeholder="Bank Name, A/C No, IFSC"></textarea>
    </div>
    <div class="form-group">
      <label for="notes">Remarks / Notes</label>
      <textarea id="notes" name="notes" rows="2"></textarea>
    </div>
    <button type="submit">Save Party</button>
  </form>
</div>

<div class="container hidden" id="listView">
  <h2>Saved Parties</h2>
  <div id="partyList"></div>
  <button id="backBtn" onclick="backToForm()">← Back</button>
</div>

<div class="container hidden" id="detailView">
  <h2>Party Details</h2>
  <div id="partyDetail"></div>
  <button id="backBtn" onclick="showPartyList()">← Back to List</button>
</div>

<script>
  const parties = [];

  document.getElementById("partyForm").addEventListener("submit", function(e) {
    e.preventDefault();

    const party = {
      type: document.getElementById("partyType").value,
      name: document.getElementById("partyName").value,
      phone: document.getElementById("phone").value,
      address: document.getElementById("address").value,
    };

    parties.push(party);
    alert("Party saved successfully!");
    this.reset();
  });

  function showPartyList() {
    document.getElementById("formView").classList.add("hidden");
    document.getElementById("detailView").classList.add("hidden");
    document.getElementById("listView").classList.remove("hidden");

    const list = document.getElementById("partyList");
    list.innerHTML = "";

    parties.forEach((party, index) => {
      const btn = document.createElement("button");
      btn.innerText = `${party.name} (${party.type})`;
      btn.onclick = () => showPartyDetails(index);
      list.appendChild(btn);
    });
  }

  function showPartyDetails(index) {
    const party = parties[index];
    document.getElementById("listView").classList.add("hidden");
    document.getElementById("detailView").classList.remove("hidden");

    const detail = document.getElementById("partyDetail");
    detail.innerHTML = `
      <div class="party-card">
        <strong>Type:</strong> ${party.type}<br>
        <strong>Name:</strong> ${party.name}<br>
        <strong>Phone:</strong> ${party.phone}<br>
        <strong>Address:</strong> ${party.address}
      </div>
    `;
  }

  function backToForm() {
    document.getElementById("formView").classList.remove("hidden");
    document.getElementById("listView").classList.add("hidden");
    document.getElementById("detailView").classList.add("hidden");
  }
</script>