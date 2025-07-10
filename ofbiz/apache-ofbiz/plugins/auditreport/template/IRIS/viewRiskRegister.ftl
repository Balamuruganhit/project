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
      background: #0c2d7c;
      padding: 10px;
      color:white;
      margin: 0;
      height:9rem;
      vertical-align:center;
      flex-grow: 1;
         
    }

    .header-info {
      text-align: right;
      padding-left: 10px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
      min-width: 1800px;
    }

    th, td {
      border: 1px solid #000;
      padding: 8px;
      text-align: left;
    }

    .footer {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
    }

    input {
      border: 0px;
      margin-left: 1rem;
      padding: 1rem;
      border-bottom: 1px dashed black;
    }

    input[type="date"] {
      width: 16rem;
    }

    button {
      margin-top: 3rem;
      padding: 0.6rem 1.2rem;
      font-size: 1rem;
    }

    .cell-editable {
      padding: 0.7rem;
      min-height: 30px;
      cursor: pointer;
    }

    /* Popup Editor */
    #editorModal {
  display: none;
  position: fixed;
  top: 0; left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0,0,0,0.4);
  justify-content: center;
  align-items: center;
  z-index: 999;
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
}

#editorModal.show {
  display: flex;
  opacity: 1;
}

#editorBox {
  background: white;
  padding: 20px;
  width: 60%;
  max-width: 600px;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.3);
  transform: scale(0.9);
  animation: popupZoom 0.3s ease forwards;
}

@keyframes popupZoom {
  from {
    transform: scale(0.9);
    opacity: 0;
  }
  to {
    transform: scale(1);
    opacity: 1;
  }
}


    #editorTextarea {
      height: 200px;
      font-size: 16px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      resize: vertical;
    }

    .editor-buttons {
      display: flex;
      justify-content: flex-end;
    }

    .editor-buttons button {
      padding: 8px 16px;
      background-color: #0c2d7c;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
    }

    .scroll-wrapper {
      overflow-x: auto;
      max-width: 100%;
      scrollbar-width: none;
    }

    .scroll-wrapper::-webkit-scrollbar {
      display: none;
    }
  .loading-overlay {
    display: none; /* Hidden by default */
    position: fixed;
    top: 0; left: 0;
    width: 100vw; height: 100vh;
    background: rgba(0, 0, 0, 0.5);
    z-index: 9999;
    justify-content: center;
    align-items: center;
  }

  .loading-box {
    background: white;
    padding: 2rem;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 0 10px #00000088;
  }

  .spinner {
    border: 6px solid #f3f3f3;
    border-top: 6px solid #0c2d7c;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    margin: 0 auto 1rem;
    animation: spin 1s linear infinite;
  }

  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }

  .loading-text {
    font-size: 1.2rem;
    color: #0c2d7c;
  }


  </style>
<div class="container">
  <header class="header">
    <h1 style="color:white;">Risk Register</h1>
    <#if ramsOutputTitle?has_content>
      <div class="header-info">
        <div>Ref No: <input id="docId" value="${ramsOutputTitle.docId!""}"/></div>
        <div>Rev No: <input id="revision" value="${ramsOutputTitle.revision!""}"/></div>
        <div style="margin-top:1rem;">Date: <input type="date" id="saveDate" value="${ramsOutputTitle.date!""}"/></div>
      </div>
      <#else>
            <div class="header-info">
        <div>Ref No: <input id="docId" /></div>
        <div>Rev No: <input id="revision" /></div>
        <div style="margin-top:1rem;">Date: <input type="date" id="saveDate" /></div>
      </div>
      </#if>
  </header>

  <div class="scroll-wrapper">
    <table>
      <thead>
        <tr>
          <th>Risk Id</th>
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
          <th>Effectiveness of Actions Taken</th>
          <th>Residual Risk Rating</th>
          <th>Action Due Date</th>
          <th>Status</th>
          <th>Evidence/References</th>
          <th>Warranty</th>
        </tr>
      </thead>
      <tbody>
      <#list ramsOutputDetails as group>
        <tr>
          
            <td><div >${group.riskId!" "}</div></td>
             <td><div >${group.description!" "}</div></td>
              <td><div >${group.owner!" "}</div></td>
             <td><div >${group.category!" "}</div></td>
              <td><div >${group.dateIdentified!" "}</div></td>
            <td><div >${group.hazard!" "}</div></td>
            <td><div >${group.consequence!" "}</div></td>
            <td><div >${group.controls!" "}</div></td>
            <td><div >${group.effectiveness!" "}</div></td>
            <td><div >${group.likelihood!" "}</div></td>
            <td><div >${group.severity!" "}</div></td>
            <td><div >${group.initialRiskRating!" "}</div></td>
            <td><div >${group.mitigation!" "}</div></td>
            <td><div >${group.actionsTaken!" "}</div></td>
            <td><div >${group.residualRisk!" "}</div></td>
            <td><div >${group.actiondate!" "}</div></td>
            <td><div >${group.status!" "}</div></td>
            <td><div >${group.evidence!" "}</div></td>
          <td style="width:7rem">
            <strong>From date</strong> ${group.warrantyFrom}
            <strong>To date</strong> ${group.warrantyTo}
          </td>
        </tr>
      </#list>
      </tbody>
    </table>
  </div>

  <#if ramsOutputTitle?has_content>  
    <footer class="footer">
      <div>Prepared By:<input  id="preparer" value="${ramsOutputTitle.prepared!""}"/></div>
      <div>Previewer By:<input id="previewer" value="${ramsOutputTitle.previewer!""}"/></div>
      <div>Approved By:<input id="approver" value="${ramsOutputTitle.approve!""}"/></div>
    </footer>
    <#else>
    <footer class="footer">
      <div>Prepared By:<input  id="preparer" /></div>
      <div>Previewer By:<input id="previewer" /></div>
      <div>Approved By:<input id="approver" /></div>
    </footer>
    </#if>

    <button ><a style="color:black" href="RiskRegisterReport?printdoc=done&docId=${ramsOutputTitle.docId}">Print Document</a></button>

</div>