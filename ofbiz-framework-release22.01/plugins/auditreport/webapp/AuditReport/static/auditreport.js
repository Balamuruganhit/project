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
  const datalist = document.getElementById('listReport');
  const commentField = document.getElementById('comment');
  const charCount = document.getElementById('charCount');
  const reportCount=document.getElementById('reportCount');
  const reportField = document.getElementById('reportId');
  const uniqueValues = new Set();
  console.log(reportField)
  datalist.innerHTML = '';
  let formDataArray = [];
  reportField.addEventListener('input', function () { 
    const currentLengthId = reportField.value.length;
    reportCount.textContent = `${currentLengthId}/20`;

    // Apply red border if limit exceeded, otherwise remove it
    if (currentLengthId > 20) {
      reportField.style.border = '2px solid red';
    } else {
      reportField.style.border = ''; // Reset to default
    }
  });

  commentField.addEventListener('input', function () {
    const currentLength = commentField.value.length;
    charCount.textContent = `${currentLength}/250`;

    // Apply red border if limit exceeded, otherwise remove it
    if (currentLength > 250) {
      commentField.style.border = '2px solid red';
    } else {
      commentField.style.border = ''; // Reset to default
    }
  });

  
  // Add Button Logic
  addButton.addEventListener("click", (event) => {
      event.preventDefault();
      const reportId = document.getElementById("reportId").value;
      const question = document.getElementById("question").value;
      const rating = document.getElementById("rating").value;
      const comment = document.getElementById("comment").value;
      const proofInput = document.getElementById("proof");
      const approve = document.getElementById("approve").value;
      const commentLength = commentField.value.length;
      const reportLength=reportField.value.length;
      // Handle File Upload
      const proofFile = proofInput.files[0];

      if (reportLength > 20) {
        alert('ReportId  should not exceed 20 AlphaNumeric .');
        reportField.style.border = '2px solid red'; // Ensure red border on submit
        return;
      }

      if (commentLength > 250) {
        alert('Comment should not exceed 250 characters.');
        commentField.style.border = '2px solid red'; // Ensure red border on submit
        return;
      }
      if (!reportId || !question || !rating || !comment || !approve) {
        alert("All fields are required.");
        return;
      }
      if (proofFile && proofFile.size > 2 * 1024 * 1024) { // 2MB size limit
        alert("Proof file size exceeds the limit of 2MB.");
        return;
      }
      if (!proofFile) {
          alert("Please select a proof file.");
          return;
      }
      const reader = new FileReader();
      reader.onload = function (e) {
          const proofData = e.target.result; // Base64 encoded string
          // Add row to table
          const newRow = `
              <tr class="alternate-row">
                  <td id ="listId">${reportId}</td>
                  <td>${question}</td>
                  <td>${rating}</td>
                  <td>${comment}</td>
                  <td><img src="${proofData}" alt="Proof" style="width: 50px; height: 50px;" /></td>
                  <td>${approve }</td>
                  <td><button class="delete-btn">Delete</button></td>
          `;
          dataTable.innerHTML += newRow;
          // Store data in array
          formDataArray.push({
              reportId: reportId,
              question: question,
              rating: rating,
              comment: comment,
              proof: proofData,
              approve: approve,
          });
          // Reset Form
          reportCount.textContent =`${0}/20`;
          charCount.textContent =`${0}/250`;
          document.getElementById("AddReportDetail").reset();
      };
      // Read file as Base64
      reader.readAsDataURL(proofFile);
      if (uniqueValues.has(reportId)) {
        return;
      }
  
      // Add Report ID to the datalist
      uniqueValues.add(reportId);
      const option = document.createElement('option');
      option.value = reportId;
      datalist.appendChild(option);
  });
  dataTable.addEventListener("click", (event) => {
    if (event.target.classList.contains("delete-btn")) {
        const rowIndex = event.target.closest("tr").rowIndex - 1; // Get the row index of the clicked delete button (excluding the header row)
        
        // Remove from the array
        formDataArray.splice(rowIndex, 1);

        // Remove from the table (UI)
        event.target.closest("tr").remove();
    }
});


  //data validation in each field



  // Submit Button Logic
  submitButton.addEventListener("click", async (event) => {
      event.preventDefault();
      if (formDataArray.length === 0) {
          alert("No data to submit.");
          return;
      }
      const payload = JSON.stringify({ reportDetails : formDataArray});

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
