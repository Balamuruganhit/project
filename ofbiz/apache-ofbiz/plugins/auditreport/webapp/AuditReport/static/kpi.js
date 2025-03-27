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

console.log("hi")

    function calculateEfficiency(index) {
        const planned = document.getElementsByClassName("planned")[index].value;
        const actual = document.getElementsByClassName("actual")[index].value;
        const efficiencyCell = document.getElementsByClassName("efficiency")[index];
        const targetCell = document.getElementsByClassName("target")[index];

        const plannedValue = parseFloat(planned) || 0;
        const actualValue = parseFloat(actual) || 1; // Avoid division by zero

        if (plannedValue > 0) {
            const efficiency = ( actualValue/ plannedValue) * 100;
            efficiencyCell.textContent = efficiency.toFixed(2);
            targetCell.textContent = efficiency >= 85 ? "Yes" : "No";
        } else {
            efficiencyCell.textContent = "";
            targetCell.textContent = "";
        }
    }

    function exportToPDF() {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        
        console.log(document.getElementById("partNumber").value);
        doc.text("Production Plan Vs Actual Plan ERP Report", 14, 10);

        doc.autoTable({
            head: [["Part Number", "Month", "Planned", "Actual", "Efficiency", "Target", "Remark"]],
            body: [...document.querySelectorAll("tbody tr")].map((row, i) => {
                const rowData = [...row.querySelectorAll("td")].map(td => 
                    td.querySelector("input") ? td.querySelector("input").value : td.textContent
                );
                if (i === 1) rowData.unshift(document.getElementById("partNumber").value);

                return rowData;
            }),
        });

        doc.text(`Prepared By: ${document.getElementById("preparedBy").value}`, 10, doc.lastAutoTable.finalY + 10);
        doc.text(`Checked By: ${document.getElementById("checkedBy").value}`, 10, doc.lastAutoTable.finalY + 20);

        doc.save(`${document.getElementById("partNumber").value}.pdf`);
    }

    function exportToExcel() {
        let table = document.querySelector("table");
        let ws = XLSX.utils.table_to_sheet(table);
        let wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, "Sheet1");

        // Append "Prepared By" & "Checked By" at the bottom of the Excel sheet
        let preparedBy = document.getElementById("preparedBy").value;
        let checkedBy = document.getElementById("checkedBy").value;
        XLSX.utils.sheet_add_aoa(ws, [["Prepared By:", preparedBy], ["Checked By:", checkedBy]], { origin: -1 });

        XLSX.writeFile(wb, "table.xlsx");
    }