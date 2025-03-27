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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.6.0/jspdf.plugin.autotable.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            
        }
        .table-container {
            overflow-x: auto;
            position: relative;
        }
        textarea{
            resize: none;
        }
        table {
            width:90%;
            border-collapse: collapse;
            text-align: center;
            table-layout: fixed;
            border: 1px solid black;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 0px;
            text-align: center;
        }
        thead th{
            padding:8px;
        }
        th {
            background-color: #f4f4f4;
            position: sticky;
            top: 0;
            z-index: 2;
        }
        .part-number-cell {
            position: sticky;
            left: 0;
            background-color: white;
            z-index: 3;
            vertical-align: middle;
            font-weight: bold;
        }
        .footer-section {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .footer-section input {
            width: 200px;
            padding: 5px;
            border: 1px solid #ccc;
        }
        .buttons {
            margin-top: 10px;
        }
        .buttons button {
            padding: 10px;
            margin-right: 10px;
            cursor: pointer;
            border: none;
            color: white;
        }
        .pdf-btn {
            background-color: blue;
        }
        .excel-btn {
            background-color: green;
        }
        .actual{
            padding:0px;
            width:60%;
        }
        .planned{
            padding:0px;
            width:60%
        }
        .remark{
            width:80%
        }
        .month{
            width:89%;
        }
        
       
    </style>

<div class="table-container">
    <table>
        <thead>
            <tr>
                <th class="part-number-cell">Part Number</th>
                <th>Month</th>
                <th>Planned Production</th>
                <th>Actual Production</th>
                <th>Efficiency (%)</th>
                <th>Target Achieved (>=85%)? yes/No</th>
                <th>Remark</th>
            </tr>
        </thead>
        <tbody id="table-body">
            <!-- Merged Part Number Cell -->
            <tr>
                <td class="part-number-cell" rowspan="9">
                    <textarea type="text" id="partNumber" style="width: 80%;" rows="30"></textarea>
                </td>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(0)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(0)"></td>
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>
            <!-- Remaining rows without Part Number -->
            
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(1)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(1)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(2)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(2)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>   
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(3)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(3)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>   
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(4)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(4)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>   
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(5)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(5)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>   
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(6)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(6)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>   
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(7)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(7)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>   
            <tr>
                <td><input type="month" class="month"></td>
                <td><input type="number" class="planned" oninput="calculateEfficiency(8)"></td>
                <td><input type="number" class="actual" oninput="calculateEfficiency(8)"></td>
                
                <td class="efficiency"></td>
                <td class="target"></td>
                <td><textarea type="text" class="remark" rows="2"></textarea></td>
            </tr>   
                                      
                    
        </tbody>
    </table>
</div>

<!-- Footer Section for "Prepared By" and "Checked By" -->
<div class="footer-section">
    <label>Prepared By: <input type="text" id="preparedBy"></label>
    <label>Checked By: <input type="text" id="checkedBy"></label>
</div>

<div class="buttons">
    <button class="pdf-btn" onclick="exportToPDF()">Export to PDF</button>
    <button class="excel-btn" onclick="exportToExcel()">Export to Excel</button>
</div>


