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
