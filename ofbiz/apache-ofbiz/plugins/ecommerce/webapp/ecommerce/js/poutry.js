/*
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.
*/
console.log('poutry')

  const form = document.getElementById('inventoryForm');
  const tableBody = document.querySelector('#inventoryTable tbody');

  form.addEventListener('submit', function(event) {
    event.preventDefault();

    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${document.getElementById('itemName').value}</td>
      <td>${document.getElementById('itemCategory').value}</td>
      <td>${document.getElementById('unit').value}</td>
      <td>${document.getElementById('quantity').value}</td>
      <td>${document.getElementById('reorder').value}</td>
      <td>${document.getElementById('supplier').value}</td>
      <td>${document.getElementById('purchaseDate').value}</td>
      <td>${document.getElementById('expiryDate').value}</td>
    `;
    tableBody.appendChild(row);
    form.reset();
  });