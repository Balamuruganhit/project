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


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
      google.charts.load("current", { packages: ["gauge"] });
      google.charts.setOnLoadCallback(drawGauge);

      let gauge, data;

      function drawGauge() {
        data = google.visualization.arrayToDataTable([
          ["Label", "Value"],
          ["Temp °C", 0],
        ]);

        const options = {
          width: 400,
          height: 220,
          redFrom: 35,
          redTo: 100,
          yellowFrom: 30,
          yellowTo: 35,
          minorTicks: 5,
          max: 50,
        };

        gauge = new google.visualization.Gauge(document.getElementById("gauge_div"));
        gauge.draw(data, options);

        // Load the initial data
        fetchData();
        setInterval(fetchData, 10000); // Refresh every 10 seconds
      }

      function fetchData() {
        const sheetID = "1wEmFQQFs_v2x8beXvTmfut8ExbsSXu0Myd0FfxwwX40";
        const queryString = encodeURIComponent("SELECT B ORDER BY A DESC LIMIT 1");

        const url = `https://docs.google.com/spreadsheets/d/${sheetID}/gviz/tq?sheet=Sheet1&tq=${queryString}`;

        fetch(url)
          .then((res) => res.text())
          .then((rep) => {
            const json = JSON.parse(rep.substr(47).slice(0, -2));
            const value = parseFloat(json.table.rows[0].c[0].v);
            data.setValue(0, 1, value);
            gauge.draw(data);
          })
          .catch((err) => {
            console.error("Fetch error:", err);
          });
      }
      
</script>

<style>
     

      h2 {
        color: #333;
      }

      #gauge_div {
        margin: auto;
        padding-top: 20px;
      }
      .flexer{
        display:flex;
        flex-direction:column;
      }
      h2 {
      text-align: center;
      color: #333;
    }
    #youtube-videos {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      margin-top: 20px;
    }
    iframe {
      width: 300px;
      height: 170px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      border: none;
    }
</style>
<div class="flexer">
    <h2 style="text-align:center;">Live ESP32 Temperature</h2>
    <div id="gauge_div"></div>
</div>

<h2>Latest Poultry Farming News</h2>
<div id="youtube-videos">Loading videos...</div>


