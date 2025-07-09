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

<style>
 .container {
  border: 1px solid #000;
  padding: 20px;
  max-width: 120rem;
  margin: auto;
  background: white;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 2px solid #000;
  padding-bottom: 10px;
}

.header h1 {
  background: #3699ff;
  padding: 10px;
  margin: 0;
  flex-grow: 1;
}

.header-info {
  text-align: right;
  padding-left: 10px;
}

.sub-header {
  display: flex;
  justify-content: space-between;
  margin: 10px 0;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 10px;
}

th, td {
  border: 1px solid #000;
  padding: 8px;
  text-align: left;
}

ul {
  margin: 0;
  padding-left: 18px;
}

.footer {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}
input{
    border:0px;
    margin-left:1rem;
    padding:1rem;
    border-bottom:1px dashed black;
}
input[type="date"]{
    width:16rem;
}
button{
    margin-top:3rem;
}
</style>


<div class="container" >
    <header class="header">
      <h1>Risk Register</h1>
      
      <div class="header-info">
        <div>Ref No: <input id="docId" /></div>
        <div>Rev No: <input id="revision" /></div>
        <div style="margin-top:1rem;">Date: <input type="date" id="saveDate" /></div>
      </div>
      
    </header>
  <div style="overflow-x: auto; max-width: 100%; scrollbar-width: none;">
      <table>
          <thead>
            <tr>
                <th style="padding:2rem;">Risk Id</th>
                <th>Risk Description</th>
                <th>Risk Owner</th>
                <th>Risk Category</th>
                <th>Date Identified</th>
                <th>Hazard/Cause</th>
                <th>Potential Consequence</th>
                <th>Existing Controls</th>
                <th>Effectiveness of Controls</th>
                <th>Likelihood</th>
                <th>Consequence/Severity</th>
                <th>Initial Risk Rating</th>
                <th>Additional Mitigation Actions</th>
                <th>Effectiveness of  Actions Taken</th>
                <th>Residual Risk Rating</th>
                <th>Action Due Date</th>
                <th>Status</th>
                <th>Evidence/References</th>
                <th>Warranty</th>
            </tr>
          </thead>
          <tbody>
            <tr>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                 <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
                 <td><div   contenteditable="true" style="padding:0.7rem"></div></td>
            </tr>
            
            
          </tbody>
      </table>
      </div>

    <footer class="footer">
      <div>Prepared By:<input  id="preparer" /></div>
      <div>Previewer By:<input id="previewer" /></div>
      <div>Approved By:<input id="approver" /></div>
    </footer>
   
    
      <button id="addRowBtn">Add Row</button>
      <button id="SaveBtn">Save</button>
  
    
  </div>