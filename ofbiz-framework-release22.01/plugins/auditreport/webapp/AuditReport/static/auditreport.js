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


document.addEventListener("DOMContentLoaded", () => {
  const dataTable = document.getElementById("data-table-body");
  const submitButton = document.getElementById("submit-button");
  const addButton = document.getElementById("add-button");

  // Array to hold the form data
  let formDataArray = [];

  // Function to handle the "Add" button click
  addButton.addEventListener("click", (event) => {
    event.preventDefault();

    // Collect form inputs
    const reportId = document.getElementById("reportId").value;
    const question = document.getElementById("question").value;
    const rating = document.getElementById("rating").value;
    const comment = document.getElementById("comment").value;
    const approve = document.getElementById("approve").checked ? "Yes" : "No";
    const proofInput = document.getElementById("proof");
    const proofFile = proofInput.files[0];

    // Validate file input
    if (!proofFile) {
      alert("Please select a proof file.");
      return;
    }

    const reader = new FileReader();
    reader.onload = function (e) {
      const proofData = e.target.result; // Base64 string

      // Add the row to the table
      const newRow = `
        <tr>
          <td>${reportId}</td>
          <td>${question}</td>
          <td>${rating}</td>
          <td>${comment}</td>
          <td><img src="${proofData}" alt="Proof" style="width: 50px; height: 50px;" /></td>
          <td>${approve}</td>
        </tr>
      `;
      dataTable.innerHTML += newRow;

      // Add the data to the array
      formDataArray.push({
        reportId: reportId,
        question: question,
        rating: rating,
        comment: comment,
        proof: proofData, // Base64 image
        approve: approve,
      });

      // Reset the form fields
      document.getElementById("form").reset();
    };

    // Read file as Base64
    reader.readAsDataURL(proofFile);
  });

  // Function to handle the "Submit" button click
  submitButton.addEventListener("click", (event) => {
    event.preventDefault();

    if (formDataArray.length === 0) {
      alert("No data to submit.");
      return;
    }

    // Create the payload
    const payload = JSON.stringify( {reportDetails:formDataArray});

    // Prepare the XHR request
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/AuditReport/control/createReportDetail", true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          console.log("Success:", xhr.responseText);
          alert("Data submitted successfully.");
          formDataArray = []; // Clear the array after successful submission
          dataTable.innerHTML = ""; // Clear the table
        } else {
          console.error("Error:", xhr.status, xhr.statusText);
          alert("Failed to submit data.");
        }
      }
    };

    // Send the request
    xhr.send(payload);
  });
});
