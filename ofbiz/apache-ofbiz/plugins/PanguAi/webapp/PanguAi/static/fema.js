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
console.log("hello i am from Fema")   
var multipleValue=1;
var multipleValue2=1;
const generate=document.getElementById('doc');
const textarea_input=document.getElementById('finalValue');
const textarea_input2=document.getElementById('finalValue2');
const select_Buttons=document.querySelectorAll('select');
const button_submit=document.getElementById('button_submit');
const button_submit2=document.getElementById('button_submit2');
const saveButton=document.getElementById('save');
const but=document.getElementById('calrms')
but.addEventListener('click',()=>{
  const timePeriod = parseFloat(document.getElementById("timePeriod").value);
    const failures = parseInt(document.getElementById("failures").value);
   
    if (isNaN(timePeriod) || isNaN(failures) || timePeriod <= 0 || failures < 0) {
      alert("Please enter valid input values.");
      return;
    }

    const hoursPerYear = 8766;

    // Best estimate of failure rate (per year)
    
    const mtbf = timePeriod / failures;

    // Confidence bounds using Chi-square
    const alpha = 0.10;
    const actual=jStat.chisquare.inv(0.5, (2 * failures)+2);
    const lowerChi = jStat.chisquare.inv(0.05, (2 * failures)+2);
    const upperChi = jStat.chisquare.inv(0.95, (2 * failures)+2);

    const actualBand= (2 * timePeriod * hoursPerYear) / actual;
    const lowerBound =(2 * timePeriod * hoursPerYear) /  lowerChi;
    const upperBound = (2 * timePeriod * hoursPerYear) / upperChi ;

    const failLower = hoursPerYear / lowerBound;
    const failUpper =  hoursPerYear / upperBound;
    const failureRate =  hoursPerYear / actualBand;


    // Display results
    document.getElementById("output").innerHTML = `
      <h3>Results</h3>
      <table>
        <tr><th>Results</th><th>Failure Rates</th><th>Equivalent MTBFs</th></tr>
        <tr><td>Best estimate of failure rate</td><td><strong>${failureRate.toFixed(2)}</strong> per year</td><td><strong>${actualBand.toFixed(0)}</strong> hours</td></tr>
        <tr><td>90% confidence interval - upper bound</td><td>${failLower.toFixed(2)} per year</td><td>${lowerBound.toFixed(0)} hours</td></tr>
        <tr><td>90% confidence interval - lower bound</td><td>${failUpper.toFixed(2)} per year</td><td>${upperBound.toFixed(0)} hours</td></tr>
      </table>
    `;
  
})
button_submit.addEventListener('click',()=>{
    
        select_Buttons.forEach(select_Button => {
        if(!select_Button.dataset.id){
        multipleValue=select_Button.value*multipleValue;
        }
    }
    )
    textarea_input.value=multipleValue;
    console.log(multipleValue)
    multipleValue=1;
})
button_submit2.addEventListener('click',()=>{
        select_Buttons.forEach(select_Button => {
            if(select_Button.dataset.id){
                multipleValue2=select_Button.value*multipleValue2;
                console.log('multipleValue2')
            }
    }
    )
    textarea_input2.value=multipleValue2;
    console.log(multipleValue2)
    multipleValue2=1;
})
storedData = []; // Clear previous data if needed
storedetail=[];
storeObject=[];
merged=[];
saveButton.addEventListener("click", async (event) => {
    const rows = document.querySelectorAll('.HeightSetter');
    const detailrows=document.querySelectorAll('.detail');
    console.log(detailrows)
   
    var placedetector=0;
    detailrows.forEach(detail =>{
        const inputs = detail.querySelectorAll('textarea, input');
        console.log(inputs)
        detailData={};
        const inputfield=['drawing','part','rev','dfema','comp','design','prepare','team','date'];
        inputs.forEach(step=>{
            if(inputfield[placedetector]){
                detailData[inputfield[placedetector]]=step.value.trim();
                placedetector++;
                console.log(placedetector)
            }
        })
        storedetail.push(detailData)
    })
    const merged = Object.assign({}, ...storedetail);
    storeObject.push(merged)
    console.log(storeObject)
    console.log(rows)
    rows.forEach(row => {
const inputs = row.querySelectorAll('textarea, select, input[type="text"]');
const rowData = {};

// Assume that the inputs follow a specific order and match them accordingly
const inputFields = [
    "item", "function", "achieve", "FailureMode", "PotentialEffects", "Severity",
    "PotentialCause", "Occurrence", "DesignControl","DetectionControl", "Detection", "RPN",
    "Action", "Responsibility", "ActionTaken", "Severity1", "Occurrence1", "Detection1", "RPN1",
];
inputs.forEach((input, index) => {
    if (inputFields[index]) {
        rowData[inputFields[index]] = input.value.trim();
    }
});

storedData.push(rowData);
});

    console.log('All Stored Rows:', storedData);
    merge=[...storeObject,...storedData]




    // const merged = [...storedetail, ...storedData];
    console.log(merge)
    console.log(storedetail)
    if (storeObject.length === 0) {
        alert("No data to submit.");
        return;
    }
    const payload = JSON.stringify({ femaDetails : merge });

    // Prepare the XHR request
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/PanguAi/control/createFemaReport", true);
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          console.log("Success:", xhr.responseText);
          alert("Data Stored successfully.");
        } else {
          console.error("Error:", xhr.status, xhr.statusText);
          alert("Failed to submit data.");
        }
      }
    };

    // Send the request
    xhr.send(payload);
  });
 
 
})