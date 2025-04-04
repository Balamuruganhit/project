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
 <!-- jsPDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<!-- jsPDF AutoTable Plugin -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>

<style>
        
        table {
            width: 100%;
            display: table-cell;
            border-collapse: collapse;
        }
        th, td {
            border: 2px solid black;
            padding: 8px;
            text-align: center;
            font-size: 12px;
            
            
        }
        th {
            background-color:rgb(126, 187, 240);
        }
        .header-table td {
            font-weight: bold;
            text-align: left;
            border: none;
            padding: 5px;
        }
        .colorAdd{
            background:rgb(173, 170, 170);
        }
        .HeightSetter td{
            height:8rem;
        }
        .input{
            width:10rem;
            height:5rem;
            resize:none;
        }
        .biggerInput{
            width:40rem;
            height:5rem;
            resize:none;
        }
        .inputSize{
            width:55rem;
            resize:none;
        }
       
        .input1{
            width:8rem;
            height: 9rem;
            resize:none;
        }
        textarea::-webkit-scrollbar {
            display: none; /* Hides scrollbar in WebKit browsers */
            }
        .input12{
            width:3rem;
            height: 2rem;
            resize:none;
            margin-bottom:10px;
        }
        .HeightSetter textarea{
            resize:none;
        }
        
       .flex{
        display:flex;
        flex-direction:column;
       }
       .setter{
        width:20rem
       }
       #generate{
        margin-top:1rem;
       }
       
</style>


    <center>
        <h2><b>DESIGN</b></h2>
        <br/>
        <h2>FAILURE MODE AND EFFECT ANALYSIS</h2>
        <br/>
        <h2>(D-FMEA)</h2>
        <br/>
    </center>
<div class="flex">
    <table class="mytable">
        <tr>
            <th class="bolderHeader" colspan="2">Drawing</th>
            <td colspan="2"><input type="text"/></td>
            <th>Part Name:</th>
            <td colspan="3" style="padding:0px;"><input type="text"/></td>
            <th>Rev:</th>
            <td colspan="2"><input type="text"/></td>
            <th>DFMEA Number</th>
            <td colspan="2"><input type="text"/></td>
        </tr>
        <tr>
            <th colspan="3">System Subsystem Components:</th>
            <td colspan="2"><textarea class="input" type="text"></textarea></td>
            <th>Design Responsibility:</th>
            <td colspan="5"><textarea class="biggerInput"  type="text"></textarea></td>
            <th>Prepared By:<br>Approved By:</th>
            <td colspan="2"><textarea class="input" type="text"></textarea>
            </td>
        </tr>
        <tr>
            <th colspan="3">Team Members</th>
            <td colspan="8"><textarea class="inputSize" type="text"></textarea></td>
            <th>Date:</th>
            <td colspan="1"><input type="Date"/></td>
        </tr> 
    </table>
    
    <table class="mytable">
       <tr class="change">
            <th >Item</th>
            <th>Function</th>
            <th >Requirements</th>
            <th >Potential Failure Mode</th>
            <th >Potential Effects of Failure</th>
            <th >Severity (S)</th>
            <th >Potential Cause / Mechanism of Failure</th>
            <th>Occurrence (O)</th>
            <th >Current Design Control</th>
            <th >Detection Control</th>
            <th>Deductions (D)</th>
        </tr>
        <tr>
            <th colspan="8">Function and Requirement Focus:</th>
            <th colspan="6">Design Process Focus:</th>
            
        </tr>
        <tr>
            <th colspan="4">Section 1</th>
            <th colspan="4">Section 2</th>
            <th>Section 3</th>
            <th></th>
            <th colspan="4">Section 4</th>
            
           
        </tr>
        <tr class="colorAdd">
            <td>What is the item that you are focusing on?</td>
            <td>What function does the item have?</td>
            <td>What are you trying to achieve (Product Requirement)?</td>
            <td>How could you get the requirements wrong (Failure Mode)?</td>
            <td>What could happen if it goes wrong (Potential Effects)?</td>
            <td>How bad would it be if it goes wrong (Severity Score)?</td>
            <td>What would need to fail in the design to cause the failure mode to occur (Potential Cause)?</td>
            <td>How likely is it to go wrong (Occurrence Score)?</td>
            <td>How could this be prevented (Prevention Control)?</td>
            <td>How will you check if the cause and/or failure mode occurs (Detection Control)?</td>
            <td>How likely are you to detect the cause or failure mode if it was defective (Detection Score)?</td>
            
            
        </tr>
        <tr class="HeightSetter">
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><select >
                <#list 1..10 as i> 
                    <option value="${i}">${i}</option>
                </#list>  
            </select></td>
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><select>
                <#list 1..10 as i> 
                    <option value="${i}">${i}</option>
                </#list>  
            </select></td>
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><textarea class="input1" type="text"></textarea></td>
            <td rowspan="6"><select >
                <#list 1..10 as i> 
                    <option value="${i}">${i}</option>
                </#list>  
            </select></td>
            
        </tr>
    </table>
    </div>
    <br/>
    <br/>
    <table class="mytable">
       
        <tr>
            <th>RPN</th>
            <th>Recommended Action</th>
            <th>Responsibility & Target Date</th>
            <th>Action Taken</th>
            <th>Severity (S)</th>
            <th>Occurrence (O)</th>
            <th>Detection (D)</th>
            <th>RPN</th>
        </tr>
        <tr>
            <th colspan="3">Risk Mitigation Focus</th>
            <th colspan="5">Improvement Action Focus:</th>
        </tr>
        <tr>
            <th colspan="3">Section 5</th>
            <th colspan="5">Section 6</th>
        </tr>
        <tr class="colorAdd">
            <td>Risk Priority Number (RPN)</td>
            <td>List of actions required to mitigate key risks identified</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="HeightSetter">
            <td rowspan="6"><input class="input12" type="text" id="finalValue" disabled/><button id="button_submit">Calculate</button></td>
            <td rowspan="6"><textarea class="input1 setter" type="text"></textarea></td>
            <td rowspan="6"><textarea class="input1 setter" type="text"></textarea></td>
            <td><textarea class="input1 setter" type="text"></textarea></td>
            <td><select data-id="1">
                <#list 1..10 as i> 
                    <option value="${i}">${i}</option>
                </#list>  
            </select></td>
            <td><select data-id="1">
                <#list 1..10 as i> 
                    <option value="${i}">${i}</option>
                </#list>  
            </select></td>
            <td><select data-id="1">
                <#list 1..10 as i> 
                    <option value="${i}">${i}</option>
                </#list>  
            </select></td>
            <td><input class="input12" type="text" id="finalValue2" disabled/><button id="button_submit2">Calculate</button></td>
        </tr>
       
    </table>
    <button id="generate">Generate PDF</button>
<script>

    var multipleValue=1;
    var multipleValue2=1;
    const generate=document.getElementById('generate');
    const textarea_input=document.getElementById('finalValue');
    const textarea_input2=document.getElementById('finalValue2');
    const select_Buttons=document.querySelectorAll('select');
    const button_submit=document.getElementById('button_submit');
    const button_submit2=document.getElementById('button_submit2');
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
  document.getElementById("generate").addEventListener("click", async function () {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF('p', 'pt', 'a4');

    const tables = document.querySelectorAll('.mytable');
    const margin = 20;
    const headerHeight = 30;
    const lineSpacing = 10;
    const pageHeight = doc.internal.pageSize.getHeight();
    const pageWidth = doc.internal.pageSize.getWidth();

    let yOffset = margin + headerHeight;

    function addHeader(doc, text) {
        doc.setFontSize(14);
        doc.setFont("helvetica", "bold");
        doc.text(text, margin, margin + 10);
        doc.setDrawColor(150);
        doc.line(margin, margin + 15, pageWidth - margin, margin + 15);
    }

    addHeader(doc, "Design FMEA Report");

    function replaceInputsWithText(table) {
        const inputs = table.querySelectorAll("input, textarea");
        inputs.forEach(el => {
            const span = document.createElement('span');
            span.textContent = el.value;
            span.style.whiteSpace = 'pre-wrap';
            span.style.wordBreak = 'break-word';
            span.style.display = 'block';
            span.style.width = el.offsetWidth + 'px';
            span.style.height = el.offsetHeight + 'px';
            el.replaceWith(span);
        });
    }

    for (let i = 0; i < tables.length; i++) {
        const table = tables[i];

        replaceInputsWithText(table);

        const canvas = await html2canvas(table, {
            scale: 2,  // ✅ Reduce resolution (was 2)
            useCORS: true,
            logging: false
        });

        let imgData = canvas.toDataURL("image/jpeg",1); // ✅ Convert to JPEG with 70% quality

        const imgProps = doc.getImageProperties(imgData);
        const pdfWidth = pageWidth - margin * 2;
        const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;

        if (yOffset + pdfHeight > pageHeight) {
            doc.addPage();
            addHeader(doc, "Design FMEA Report – April 2025");
            yOffset = margin + headerHeight;
        }

        doc.addImage(imgData, 'JPEG', margin, yOffset, pdfWidth, pdfHeight);
        yOffset += pdfHeight + lineSpacing;
    }

    doc.save("FMEA_Report.pdf");
});

</script>