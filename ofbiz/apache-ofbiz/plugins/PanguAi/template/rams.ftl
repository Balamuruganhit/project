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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstat/1.9.5/jstat.min.js"></script>

 <style>
    input[type="number"] {
      width: 100px;
    }
    h2 {
      color: #800000;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }
    th, td {
      border: 1px solid #999;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f3f3f3;
    }
    .note {
      margin-top: 20px;
      font-size: 0.9em;
      color: #555;
      font-style: italic;
    }
    .Calculator{
        display:flex;
        flex-direction:row;
        flex-wrap: wrap;
        justify-content: space-evenly;
    }
    .cal{
        border: 1px solid black;
        border-radius: 1rem;
        padding: 1rem;
        text-align: left;
        margin: 1rem;
        
    }
    .headTitle{
        text-align: center;
    }
  </style>

<div class="Calculator">
    <div class="cal">
    <h2>Empirical Failure Rate Calculator</h2>

    <label>Time period for observations (years): <input type="number" id="timePeriod" value="1" step="0.01"></label><br><br>
    <label>Number of failures observed: <input type="number" id="failures" value="5" step="1"></label><br><br>
    <button id="calrms">Calculate</button>

    <div id="output">
    </div>
    </div>
    <div class="cal">
        <h2 class="headTitle">Availability</h2>
    
        <label>Failure rate: <input type="number" id="failure" value="2" step="0.01"></label><br><br>
        <label>Repair time (MTTR): <input type="number" id="repair" value="48" step="1"></label><br><br>
        <label>Planned maintenance time: <input type="number" id="maintenance" value="72" step="1"></label><br><br>
        <button id="calavail">Calculate</button>
    
        <div id="output1">
        </div>
        </div>
    <div class="cal">
        <h2>Reliability</h2>
    
        <label>Failure rate: <input type="text" id="time" value="0.09" ></label><br><br>
        <label>Time period: <input type="number" id="failuresrate" value="5" step="1"></label><br><br>
        <button  id="calreliab">Calculate</button>
    
        <div id="output2">
        
      </div>
        </div>
    <div class="cal">
        <h2>Probability of r failures in a given time period</h2>
    
        <label>Failure rate: <input type="number" id="rtimePeriod" value="1" step="0.01"></label><br><br>
        <label>Time period: <input type="number" id="rfailures" value="5" step="1"></label><br><br>
        <label>Number of failures of interest r: <input type="number" id="rinterest" value="5" step="1"></label><br><br>

        <button id="calpro">Calculate</button>
    
        <div id="output">
        <table>
          <tr><th>Results</th><th></th></tr>
        <tr><td>Probability of r  failures</td><td> %</td></tr>
        <tr><td>Probability of r or more failures</td><td>%</td></tr>
      </table></div>
        </div>
    <div class="cal">
        <h2>Probability of r failures in n independent events</h2>
    
        <label>Probability of 1 failure in 1 event: <input type="number" id="timePeriod" value="1" step="0.01"></label><br><br>
        <label>Number of independent events n: <input type="number" id="failures" value="5" step="1"></label><br><br>
        <label>Number of failures of interest r: <input type="number" id="failures" value="5" step="1"></label><br><br>

        <button onclick="calculate()">Calculate</button>
    
        <div id="output">
        <table>
          <tr><th>Results</th><th></th></tr>
        <tr><td>Probability of r  failures</td><td> %</td></tr>
        <tr><td>Probability of r or more failures</td><td>%</td></tr>
      </table></div>
        </div>
        <div class="cal">
            <h2>Has Failure Rate Really Changed?</h2>
        
            <label>Old number of failures per time period: <input type="number" id="timePeriod" value="1" step="0.01"></label><br><br>
            <label>New number of failures per time period: <input type="number" id="failures" value="5" step="1"></label><br><br>
            <button onclick="calculate()">Calculate</button>
        
            <div id="output">
                <table>
              <tr><th>Results</th><th></th></tr>
            <tr><td>Confidence that failure rate has changed</td><td> %</td></tr>
            
          </table></div>
            </div>
</div>
<script>

    
</script>


