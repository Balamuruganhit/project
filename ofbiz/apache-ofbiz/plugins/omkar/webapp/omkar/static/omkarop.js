/*.

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
*/


function addRow() {
    let table = document.getElementById("poTable");
    let rowCount = table.rows.length;
    let row = table.insertRow(rowCount);
    row.innerHTML = `
        <td>${rowCount}</td>
        <td><input type="text" class="desc"></td>
        <td><input type="text" class="hsn"></td>
        <td><input type="number" class="h" oninput="calculateAmount(this)"></td>
        <td><input type="number" class="w" oninput="calculateAmount(this)"></td>
        <td><input type="number" class="qty" oninput="calculateAmount(this)"></td>
        <td class="total-qty">0</td>
        <td><input type="number" class="rate" oninput="calculateAmount(this)"></td>
        <td><input type="number" class="tax" value="18" oninput="calculateAmount(this)"></td>
        <td class="cgst">0.00</td>
        <td class="sgst">0.00</td>
        <td class="amount">0.00</td>
        <td><button onclick="removeRow(this)">❌</button></td>
    `;
}

function removeRow(btn) {
    let row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
    updateTotals();
}

function calculateAmount(input) {
    let row = input.parentNode.parentNode;
    let h = parseFloat(row.querySelector(".h").value) || 1;
    let w = parseFloat(row.querySelector(".w").value) || 1;
    let qty = parseFloat(row.querySelector(".qty").value) || 1;
    let rate = parseFloat(row.querySelector(".rate").value) || 0;
    let tax = parseFloat(row.querySelector(".tax").value) || 0;

    let totalQty = h * w * qty;
    row.querySelector(".total-qty").textContent = totalQty;

    let total = totalQty * rate;
    let taxAmount = (total * tax) / 100;
    let cgst = taxAmount / 2;
    let sgst = taxAmount / 2;
    let grandTotal = total + taxAmount;

    row.querySelector(".cgst").textContent = cgst.toFixed(2);
    row.querySelector(".sgst").textContent = sgst.toFixed(2);
    row.querySelector(".amount").textContent = grandTotal.toFixed(2);

    updateTotals();
}

function updateTotals() {
    let subtotal = 0, cgstTotal = 0, sgstTotal = 0, grandTotal = 0;

    document.querySelectorAll(".amount").forEach(amount => {
        subtotal += parseFloat(amount.textContent) || 0;
    });

    document.querySelectorAll(".cgst").forEach(cgst => {
        cgstTotal += parseFloat(cgst.textContent) || 0;
    });

    document.querySelectorAll(".sgst").forEach(sgst => {
        sgstTotal += parseFloat(sgst.textContent) || 0;
    });

    grandTotal = subtotal;

    document.getElementById("subtotal").textContent = (subtotal - (cgstTotal + sgstTotal)).toFixed(2);
    document.getElementById("cgstTotal").textContent = cgstTotal.toFixed(2);
    document.getElementById("sgstTotal").textContent = sgstTotal.toFixed(2);
    document.getElementById("grandTotal").textContent = grandTotal.toFixed(2);
}
