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

<body>
    <div class="dashMain">
        <#if itemsList?has_content >
            <#list itemsList as item>
                <div class="status">
                    <div>
                        <h2 class="heading">NO OF ${item.facilityTypeId!}</h2>
                        <h2 class="heading_sub">${item.facilityCount!}</h2>
                    </div>
                </div>
            </#list>
        <#else>
            <h1>No Data Record</h1>
        </#if>
    </div>

    <div class="table-container">
        <#if inventoryByProduct?has_content >
            <table class="basic-table-inventory">
                <thead>
                    <tr>
                        <th>Part Number</th>
                        <th>QOH</th>
                        <th>ATH</th>
                        <th>Ordered Quantity</th>
                        <th>QOH - Min Stock</th>
                        <th>Min Stock</th>
                        <th>Reorder Qty</th>
                    </tr>
                </thead>
                <tbody>
                    <#list inventoryByProduct as resultList>
                        <tr>
                            <td>${resultList.productId!}</td>
                            <td>${resultList.totalQuantityOnHand!}</td>
                            <td>${resultList.totalAvailableToPromise!}</td>
                            <td>${resultList.quantityOnOrder!}</td>
                            <td>${resultList.offsetQOHQtyAvailable!}</td>
                            <td>${resultList.minimumStock!}</td>
                            <td>${resultList.reorderQuantity!}</td>
                        </tr>
                    </#list>
                </tbody>
            </table>
        <#else>
            <h1>No Data Record</h1>
        </#if>
    </div>

    <div class="chart-container">
        <div style="width: 40%;">
            <canvas id="pieChart" ></canvas>
        </div>
        <div style="width: 50%;">
            <canvas id="barChart"></canvas>
        </div>
    </div>

    <script>
        const partNumbers = [<#list inventoryByProduct as resultList>"${resultList.productId!}"<#if resultList_has_next>,</#if></#list>];
        const qohData = [<#list inventoryByProduct as resultList>${resultList.totalQuantityOnHand!}<#if resultList_has_next>,</#if></#list>];
        const athData = [<#list inventoryByProduct as resultList>${resultList.totalAvailableToPromise!}<#if resultList_has_next>,</#if></#list>];
        const orderQuantityData = [<#list inventoryByProduct as resultList>${resultList.quantityOnOrder!}<#if resultList_has_next>,</#if></#list>];
    </script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Pie Chart
        const pieCtx = document.getElementById('pieChart').getContext('2d');
        new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: partNumbers,
                datasets: [{
                    label: 'QOH',
                    data: qohData,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            }
        });

        // Bar Chart
        const barCtx = document.getElementById('barChart').getContext('2d');
        new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: partNumbers,
                datasets: [
                    {
                        label: 'QOH',
                        data: qohData,
                        backgroundColor: 'rgba(54, 162, 235, 0.5)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'ATH',
                        data: athData,
                        backgroundColor: 'rgba(255, 206, 86, 0.5)',
                        borderColor: 'rgba(255, 206, 86, 1)',
                        borderWidth: 1
                    },
                    {
                        label: 'Order Quantity',
                        data: orderQuantityData,
                        backgroundColor: 'rgba(75, 192, 192, 0.5)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        stacked: true
                    },
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>

