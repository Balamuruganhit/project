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


console.log("it is working")
document.addEventListener("DOMContentLoaded", () => {
    const but=document.getElementById('calrms')
    const calreliab=document.getElementById('calreliab')
    const calavail=document.getElementById('calavail')
    const calpro=document.getElementById('calpro')
   if(calavail){
    calavail.addEventListener('click',()=>{
        const ifailure=parseInt(document.getElementById('failure').value);
        const irepair=parseInt(document.getElementById('repair').value);
        const imaintenance=parseInt(document.getElementById('maintenance').value);
         
          if (isNaN(ifailure) || isNaN(irepair) ||isNaN(imaintenance)) {
            alert("Please enter valid input values.");
            return;
          }
      
          const hoursPerYear = 8766;
          console.log(ifailure,irepair,imaintenance)
          // Best estimate of failure rate (per year)
          
          const mtbf1 = hoursPerYear / ifailure;
          console.log(mtbf1)
          // Confidence bounds using Chi-square
          const sum=mtbf1 + irepair
          console.log(sum)
          var excl = ((mtbf1)/sum)*100
          console.log(excl)
          const add = imaintenance/ hoursPerYear
          var incl = excl - add ;
          console.log(incl)
          // Display results
          document.getElementById("output1").innerHTML = `
            <h3>Results</h3>
                <table>
                <tr><th>Results</th><th></th></tr>
                <tr><td>Availability excl. planned mtce</td><td>${excl.toFixed(2)} %</td></tr>
                <tr><td>Availability incl. planned mtce</td><td>${incl.toFixed(2)}%</td></tr>
            </table>
          `;
        
      })
      }
      if(calreliab){
        calreliab.addEventListener('click',()=>{
            const failureRateStr = document.getElementById("failuresrate").value.trim();
            const timeStr = document.getElementById("time").value.trim();

            const ifailureRate = parseFloat(failureRateStr.replace(',', '.'));
            const itime = parseFloat(timeStr.replace(',', '.'));

             
              if (isNaN(ifailureRate) || isNaN(itime) ) {
                alert("Please enter valid input values.");
                return;
              }
          
              const prob = Math.exp(-ifailureRate * itime)*100
              const mor= 100- prob
              console.log(ifailureRate,itime)
              console.log(prob)
              document.getElementById("output2").innerHTML = `
              <h3>Results</h3>
                    <table>
                    <tr><th>Results</th><th></th></tr>
                    <tr><td>Probability of no failures</td><td>${prob.toFixed(2)} %</td></tr>
                    <tr><td>Probability of one or more failures</td><td>${mor.toFixed(2)}%</td></tr>
                </table>  
              `;
            
          })
          }
    if(but){
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
        }
        if(calpro){
            calpro.addEventListener('click',()=>{
              const rtimePeriod = parseFloat(document.getElementById("rtimePeriod").value);
                const rfailures = parseInt(document.getElementById("rfailures").value);
                const rinterest = parseFloat(document.getElementById("rinterest").value);
                
              
            
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
            }
})