/*
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
var DocumentTreeUrl = '<@ofbizUrl request="createReportDetail" />';
document.addEventListener("DOMContentLoaded", () => {
    const dataTable = document.getElementById("data-table-body");
    const submitButton = document.getElementById("submit-button");
    const addButton = document.getElementById("add-button");

    let formDataArray = [];

    // Add Button Logic
    addButton.addEventListener("click", (event) => {
        event.preventDefault();

        const reportId = document.getElementById("reportId").value;
        const question = document.getElementById("question").value;
        const rating = document.getElementById("rating").value;
        const comment = document.getElementById("comment").value;
        const proofInput = document.getElementById("proof");
        const approve = document.getElementById("approve").checked;

        // Handle File Upload
        const proofFile = proofInput.files[0];
        if (!proofFile) {
            alert("Please select a proof file.");
            return;
        }

        const reader = new FileReader();
        reader.onload = function (e) {
            const proofData = e.target.result; // Base64 encoded string

            // Add row to table
            const newRow = `
                <tr>
                    <td>${reportId}</td>
                    <td>${question}</td>
                    <td>${rating}</td>
                    <td>${comment}</td>
                    <td><img src="${proofData}" alt="Proof" style="width: 50px; height: 50px;" /></td>
                    <td>${approve ? "Yes" : "No"}</td>
                </tr>
            `;
            dataTable.innerHTML += newRow;

            // Store data in array
            formDataArray.push({
                reportId,
                question,
                rating,
                comment,
                approve,
                proofData,
            });

            // Reset Form
            document.getElementById("AddReportDetail").reset();
        };

        // Read file as Base64
        reader.readAsDataURL(proofFile);
    });

    // Submit Button Logic
    submitButton.addEventListener("click", (event)=> {
        event.preventDefault();

        if (formDataArray.length === 0) {
            alert("No data to submit.");
            return;
        }

        try {
           for (let i = 0; i< formDataArray.length; i++) {
                    jQuery.ajax({
                        url:DocumentTreeUrl,
                        type: 'POST',
                        data: {reportId : formDataArray[i][0], question : formDataArray[i][1], rating : formDataArray[i][2], comment : formDataArray[i][3],approve : formDataArray[i][4],proof: formDataArray[i][5]},

                    });
                }
                alert("Data submitted successfully.");
                formDataArray = []; // Clear data after submission
                dataTable.innerHTML = ""; // Clear table
            } 
         catch (error) {
            console.error("Error:", error);
            alert("An error occurred while submitting the data.");
        }
        
    });
});
