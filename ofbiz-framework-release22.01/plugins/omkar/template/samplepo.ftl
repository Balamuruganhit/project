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


<div>
    <div class="container">
    

    <!-- Company Details -->
    <table class="header-table" >
        <tr style="border:1px solid black;">
            <td colspan="2" class="company-details">
                <img src="https://shorturl.at/aFFVL" alt="Company Logo" class="logo">
            
                <strong>Omkar Enterprises</strong><br>
                1st Floor, Block D, Special APMC for Fruits & Vegetables, <br>
                Binnypet Tank Bund Road, Opp E T A Mall, Bengaluru, Karnataka - 560023
            </td>
            <td class="order-details">
                <strong>PO No:</strong> <span class="highlight">ARS1932024-25</span><br>
                <strong>Date:</strong> 29.01.2025<br>
                <strong>GST No:</strong> 29AMRPY7044H1Z5<br>
                <strong>PAN No:</strong> AMRPY7044H
            </td>
        </tr>
    </table>

    <!-- Supplier & Delivery Details -->
    <table class="info-table">
        <tr>
            <td>
                <strong style="text-align: left; font-family:'Quicksand', sans-serif">To,</strong><br>
                <textarea id="toField" rows="5" style="font-family:'Quicksand', sans-serif">
    M/s Innovative Engineers
    11142, 2nd Main, Rajajinagar Industrial Town, Bangalore 560044
    GSTIN/UIN: 29ACNPR9957Q1Z0
                </textarea>
            </td>
            <td>
                <strong style="font-family:'Quicksand', sans-serif">Place of Supply / Delivery,</strong><br>
                <textarea id="supplyField" rows="5" style="font-family:'Quicksand', sans-serif">
    M/s Aniha Restore Solutions
    Special APMC For Fruits and Vegetables,
    Block-D, 1st Floor, Binnypet Tank Bund Road,
    Opp E T A Mall, Bengaluru, Karnataka - 560023
    State Code: 29
                </textarea>
            </td>
        </tr>
    </table>
    
    

    <!-- Purchase Order Table -->
    <table class="po-table" id="poTable">
        <tr>
            <th>Sl. No</th>
            <th>Description of Goods</th>
            <th>HSN</th>
            <th>H</th>
            <th>W</th>
            <th>Qty</th>
            <th>Rate</th>
            <th>%</th>
            <th>CGST</th>
            <th>SGST</th>
            <th>Amount</th>
        </tr>
        <tr>
            <td>1</td>
            <td><input type="text" class="desc"></td>
            <td><input type="text" class="hsn"></td>
            <td><input type="number" class="h" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="w" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="qty" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="rate" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="tax" value="18" oninput="calculateAmount(this)"></td>
            <td class="cgst">0.00</td>
            <td class="sgst">0.00</td>
            <td class="amount">0.00</td>
            
        </tr>
        <tr>
            <td>2</td>
            <td><input type="text" class="desc"></td>
            <td><input type="text" class="hsn"></td>
            <td><input type="number" class="h" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="w" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="qty" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="rate" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="tax" value="18" oninput="calculateAmount(this)"></td>
            <td class="cgst">0.00</td>
            <td class="sgst">0.00</td>
            <td class="amount">0.00</td>
        </tr>
        <tr>
            <td>3</td>
            <td><input type="text" class="desc"></td>
            <td><input type="text" class="hsn"></td>
            <td><input type="number" class="h" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="w" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="qty" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="rate" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="tax" value="18" oninput="calculateAmount(this)"></td>
            <td class="cgst">0.00</td>
            <td class="sgst">0.00</td>
            <td class="amount">0.00</td>
        </tr>
        <tr>
            <td>4</td>
            <td><input type="text" class="desc"></td>
            <td><input type="text" class="hsn"></td>
            <td><input type="number" class="h" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="w" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="qty" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="rate" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="tax" value="18" oninput="calculateAmount(this)"></td>
            <td class="cgst">0.00</td>
            <td class="sgst">0.00</td>
            <td class="amount">0.00</td>
        </tr>
        <tr>
            <td>5</td>
            <td><input type="text" class="desc"></td>
            <td><input type="text" class="hsn"></td>
            <td><input type="number" class="h" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="w" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="qty" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="rate" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="tax" value="18" oninput="calculateAmount(this)"></td>
            <td class="cgst">0.00</td>
            <td class="sgst">0.00</td>
            <td class="amount">0.00</td>
        </tr>
        <tr>
            <td>6</td>
            <td><input type="text" class="desc"></td>
            <td><input type="text" class="hsn"></td>
            <td><input type="number" class="h" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="w" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="qty" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="rate" oninput="calculateAmount(this)"></td>
            <td><input type="number" class="tax" value="18" oninput="calculateAmount(this)"></td>
            <td class="cgst">0.00</td>
            <td class="sgst">0.00</td>
            <td class="amount">0.00</td>
        </tr>
    </table>

    

    <!-- Totals Section -->
    <table class="total-table">
        <tr>
            <td>Before GST Amount</td>
            <td id="subtotal">0.00</td>
        </tr>
        <tr>
            <td>CGST 9%</td>
            <td id="cgstTotal">0.00</td>
        </tr>
        <tr>
            <td>SGST 9%</td>
            <td id="sgstTotal">0.00</td>
        </tr>
        <tr class="grand-total">
            <td>GRAND TOTAL</td>
            <td id="grandTotal">0.00</td>
        </tr>
    </table>

    <!-- Footer Notes -->
    <div class="footer-notes">
        <strong>Notes:</strong>
        <ol>
            <li>Please quote this order number in all supply documents.</li>
            <li>Furnish dispatch details once material is sent.</li>
            <li>Notify us if you can't supply as per schedule.</li>
            <li>Send the invoice to the address above.</li>
        </ol>
    </div>
</div>
</div>