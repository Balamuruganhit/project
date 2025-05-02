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
    const calinde=document.getElementById('calinde')
    const calfinal=document.getElementById('calFinal')
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
          const add = (imaintenance/ hoursPerYear)*100;
          console.log(`add ${add}`)
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
                <tr><td>90% confidence interval -upper bound</td><td>${failUpper.toFixed(2)} per year</td><td>${upperBound.toFixed(0)} hours</td></tr>
                <tr><td>90% confidence interval - lower bound</td><td>${failLower.toFixed(2)} per year</td><td>${lowerBound.toFixed(0)} hours</td></tr>
                
              </table>
            `;
          
        })
        }
        if(calpro){
          calpro.addEventListener('click',()=>{
                const rtimePeriod = parseFloat(document.getElementById("rtimePeriod").value);
                const rinterest = parseFloat(document.getElementById("rinterest").value);
                const failureRateStr = document.getElementById("rfailures").value.trim();
                const rfailureRate = parseFloat(failureRateStr.replace(',', '.'));
        
              
            
                // Exact factorial using gamma function for large x
              function factorial(n) {
                if (n < 0) return NaN;
                if (n === 0 || n === 1) return 1;
                let result = 1;
                for (let i = 2; i <= n; i++) result *= i;
                return result;
              }

              function poissonPMF(x, lambda) {
                if (x < 0 || lambda < 0) return 0;
                console.log("calling")
                return (Math.pow(lambda, x) * Math.exp(-lambda)) / factorial(x);
              }
              function poissonCDF(x, lambda) {
                let sum = 0;
                for (let k = 0; k <= x; k++) {
                  sum += poissonPMF(k, lambda);
                }
                return sum;
              }
              
              function poissonProbability(B8, B6, B7) {
                const lambda = B6 * B7;
              
                if (B8 === 0) {
                  return 1;
                } else {
                  return 1 - poissonCDF(B8 - 1, lambda);
                }
              }
              
            console.log(rtimePeriod,rfailureRate,rinterest)
              // Example usage:
            
              const B8 = rinterest;           // x
              const B6 = rfailureRate;         // failure rate
              const B7 = rtimePeriod;          // time
              var lambda = B6 * B7;
              console.log(B6)
              const result = poissonPMF(B8, lambda);
              console.log("P(X = x):", result.toFixed(4)*100);
              const result1 = poissonProbability(B8, B6, B7);
              console.log(`P(X ≥ ${B8}) =`, result1.toFixed(8));
              document.getElementById("output4").innerHTML = `
              <table>
                  <tr><th>Results</th><th></th></tr>
                <tr><td>Probability of r  failures</td><td>${result.toFixed(5)*100} %</td></tr>
                <tr><td>Probability of r or more failures</td><td>${result1.toFixed(5)*100}%</td></tr>
              </table>
                
              `;
              
            })
    }
    if(calinde){
      calinde.addEventListener('click',()=>{
        const itimePeriod = parseFloat(document.getElementById("itime").value);
        const event = parseFloat(document.getElementById("event").value);
        const ifailureRateStr = document.getElementById("ifailures").value.trim();
        const infailureRate = parseFloat(ifailureRateStr.replace(',', '.'));
         
          
      
          function factorial(n) {
            if (n === 0 || n === 1) return 1;
            let result = 1;
            for (let i = 2; i <= n; i++) result *= i;
            return result;
          }
          
          function binomialCoefficient(n, k) {
            return factorial(n) / (factorial(k) * factorial(n - k));
          }
          
          function binomialPMF(x, n, p) {
            if (p < 0 || p > 1 || x < 0 || x > n) return 0;
            return binomialCoefficient(n, x) * Math.pow(p, x) * Math.pow(1 - p, n - x);
          }
          
          function binomialDIST(x, n, p, cumulative) {
            if (cumulative) {
              let sum = 0;
              for (let k = 0; k <= x; k++) {
                sum += binomialPMF(k, n, p);
              }
              return sum;
            } else {
              return binomialPMF(x, n, p);
            }
          }
          console.log(event,itimePeriod,infailureRate)
          // Example values:
          const x = event;       // B21
          const n = infailureRate;      // B20
          const p = itimePeriod;     // B19
          
          const exact = (binomialDIST(x, n, p, false))*100;
          const cumulative =(1- binomialDIST(x - 1, n, p, true))*100;
          
          console.log(`P(X = ${x})        = ${exact.toFixed(8)}`);
          console.log(`P(X ≤ ${x})       = ${cumulative.toFixed(8)}`);
          
      
          // Display results
          document.getElementById("output5").innerHTML = `
            <table>
              <tr><th>Results</th><th></th></tr>
              <tr><td>Probability of r  failures</td><td>${exact.toFixed(2)} %</td></tr>
              <tr><td>Probability of r or more failures</td><td>${cumulative.toFixed(2)}%</td></tr>
            </table>
          `;
        
      })
  }
  if(calfinal){
    calfinal.addEventListener('click',()=>{
        const ioldRate=parseInt(document.getElementById('RateOldPeriod').value);
        const inewRate=parseInt(document.getElementById('RateNewfailures').value);
        const expected = ioldRate;  // B6
        const observed = inewRate;   // B7

        const testStat = Math.pow(expected - observed, 2) / expected; // ((B6 - B7)^2)/B6
        const degreesOfFreedom = 1;

        const cumulativeP = jStat.chisquare.cdf(testStat, degreesOfFreedom);

        
        console.log("Cumulative p-value:", cumulativeP.toFixed(6));
        var finalOut=(cumulativeP*100).toFixed(1)
        document.getElementById("output6").innerHTML = `
            <table>
              <tr><th>Results</th><th></th></tr>
            <tr><td>Confidence that failure rate has changed</td><td> ${finalOut}%</td></tr>
          </table>
          `; 
          
         
      })
      }
})