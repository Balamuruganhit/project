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

<div class="header_ram">
    <table>
      <tr>
        <td>RAMS number</td>
        <td><input type="text"  id="rams"></td>
        <td>Product code:</td>
        <td colspan="3"><input type="text"  id="product"></td>
      </tr>
      <tr>
        <td>System: </td>
        <td><input type="text"  id="system"></td>
        <td>Sub-System: </td>
        <td><input type="text"  id="SubSystem"></td>
        <td>Sub-sub-System: </td>
        <td><input type="text"  id="subsubsystem"></td>
      </tr>
      <tr>
        <td>RAMS responsibility:</td>
        <td colspan="3"><input type="text"  id="response"></td>
        <td>Date:</td>
        <td><input type="date"  id="date"></td>
      </tr>
      <tr>
        <td>Team members:</td>
        <td colspan="3"><input type="text"  id="member"></td>
        <td>Approved by:</td>
        <td><input type="text"  id="approver"></td>
      </tr>
    </table>
   
  </div>
  <div class="main">
    <div class="expander_section">
        <div class="plus">
          <h3>Empirical Failure Rate Calculator</h3>
          <span class="symbol">+</span>
        </div>
        <div class="calculator">
          <div class="left">
              <table>
                <tr>
                  <td>Time period for observations (years):</td>
                  <td><input type="number" id="timePeriod" value="1" step="0.01"></td>
                  <td>years</td>
                </tr>
                <tr>
                  <td>Number of failures observed:</td>
                  <td><input type="number" id="failures" value="5" step="1"></td>
                </tr>
                <tr colspan="2"><td><button id="calrms">Calculate</button></td></tr>
              </table>
          </div>
          <div class="right" id="output">
            <table>
              <tr>
                <td>Result</td>
                <td>Failure Rate</td>
                <td>Equivalent MTBFs</td>
              </tr>
              <tr>
                <td>Best estimate of failure rate</td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>90% confidence interval - upper bound</td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>90% confidence interval - lower bound</td>
                <td></td>
                <td></td>
              </tr>
            </table>
          </div>
        </div>
    </div>
    <div class="expander_section">
      <div class="plus">
        <h3>Availability</h3>
        <span class="symbol">+</span>
      </div>
      <div class="calculator">
        <div class="left">
            <table>
              <tr>
                <td>Failure rate:</td>
                <td> <input type="number" id="failure" value="2" step="0.01"></td>
                <td>per year</td>
              </tr>
              <tr>
                <td>Repair time (MTTR):</td>
                <td> <input type="number" id="repair" value="48" step="1"></td>
                <td>hours</td>
              </tr>
              <tr>
                <td>Planned maintenance time:</td>
                <td><input type="number" id="maintenance" value="72" step="1"></td>
                <td>hours per year</td>
              </tr>
              <tr><td><button id="calavail">Calculate</button></td></tr>
            </table>
        </div>
        <div class="right" id="output1">
          <table>
            
            <tr>
              <td>Result</td>
              <td></td>
            </tr>
            <tr>
              <td>Availability excl. planned mtce</td>
              <td></td>
            </tr>
            <tr>
              <td>Availability incl. planned mtce</td>
              <td></td> 
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="expander_section">
    <div class="plus">
      <h3>Reliability</h3>
      <span class="symbol">+</span>
    </div>
    <div class="calculator">
      <div class="left">
          <table>
            <tr>
              <td>Failure rate:</td>
              <td><input type="number" id="failuresrate" value="0.09" ></td>
              <td>per year</td>
            </tr>
            <tr>
              <td>Time period:</td>
              <td><input type="number" id="time" value="5" step="1"></td>
              <td>years</td>
            </tr>
            <tr><td><button id="calreliab">Calculate</button></td></tr>
          </table>
      </div>
      <div class="right" id="output2">
        <table>
          <tr>
            <td>Result</td>
            <td></td>
          </tr>
          <tr>
            <td>Probability of no failures</td>
            <td></td>
          </tr>
          <tr>
            <td>Probability of one or nore failures</td>
            <td></td>
          </tr>
        </table>
      </div>
    </div>
    </div>
    <div class="expander_section">
      <div class="plus">
        <h3>Probability of r failures in a given time period</h3>
        <span class="symbol">+</span>
      </div>
      <div class="calculator">
        <div class="left">
            <table>
              <tr>
                <td>Failure rate:</td>
                <td><input type="number" id="rfailures" value="0.1" step="0.01"></td>
              </tr>
              <tr>
                <td>Time period:</td>
                <td><input type="number" id="rtimePeriod" value="5" step="1"></td>
              </tr>
              <tr>
                <td>Number of failures of interest r:</td>
                <td><input type="number" id="rinterest" value="2" step="1"></td>
              </tr>
              <tr><td><button id="calpro">Calculate</button></td></tr>
            </table>
        </div>
        <div class="right" id="output4">
          <table>
            <tr>
              <td>Result</td>
              <td></td>
            </tr>
            <tr>
              <td>Probability of r failures</td>
              <td></td>
            </tr>
            <tr>
              <td>Probability of r or more failures</td>
              <td></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="expander_section">
      <div class="plus">
        <h3>Probability of r failures in n independent events</h3>
        <span class="symbol">+</span>
      </div>
      <div class="calculator">
        <div class="left">
            <table>
              <tr>
                <td>Probability of 1 failure in 1 event:</td>
                <td><input type="number" id="itime" value="0.01" step="0.01"></td>
              </tr>
              <tr>
                <td>Number of independent events n:</td>
                <td><input type="number" id="ifailures" value="50" step="1"></td>
              </tr>
              <tr>
                <td>Number of failures of interest r:</td>
                <td><input type="number" id="event" value="3" step="1"></td>
              </tr>
              <tr><td><button id="calinde">Calculate</button></td></tr>
            </table>
        </div>
        <div class="right" id="output5">
          <table>
            <tr>
              <td>Result</td>
              <td></td>
            </tr>
            <tr>
              <td>Probability of r failures</td>
              <td></td>
            </tr>
            <tr>
              <td>Probability of r or more failures</td>
              <td></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="expander_section">
      <div class="plus">
        <h3>Has Failure Rate Really Changed?</h3>
        <span class="symbol">+</span>
      </div>
      <div class="calculator">
        <div class="left">
            <table>
              <tr>
                <td>Old number of failures per time period:</td>
                <td><input type="number" id="RateOldPeriod" value="6" step="0.01"></td>
              </tr>
              <tr>
                <td>New number of failures per time period:</td>
                <td><input type="number" id="RateNewfailures" value="4" step="1"></td>
              </tr>
              
            </table>
            <button id="calFinal">Calculate</button>
        </div>
        <div class="right" id="output6">
          <table>
            <tr>
              <td>Result</td>
              <td></td>
              
            </tr>
            <tr>
              <td>Confidence that failure rate has changed</td>
              <td></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <button id="save">Save the File</button>
  </div>






