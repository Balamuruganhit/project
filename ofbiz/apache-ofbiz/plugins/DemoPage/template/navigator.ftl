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
body{
    margin:0px;
}
.header {
  background-color: #0c2d7c;
  color: white;
  padding: 0px;
  text-align: center;
  font-size: 1em;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  height:6rem;
}
.header h1{
    margin:0px;
    text-align:center;
    padding:2%;
}
.menu-container {
    margin-top:10rem;
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 40px;
  flex-wrap: wrap;
  padding: 20px;
}

.menu-item {
  background-color: #0c2d7c;
  color: white;
  padding: 20px 40px;
  border-radius: 10px;
  font-size: 18px;
  text-align: center;
  cursor: pointer;
  transition: background-color 0.3s;
  min-width: 200px;
}

.menu-item:hover {
  background-color: #0056b3;
}

.footer {
  text-align: center;
  padding: 20px;
  font-size: 16px;
  bottom:0%;
  color: #333;
}
a{
    text-decoration:none;
    color:white;
}
</style>

<header class="header">
    <h1>Welcome to Pangun Tech</h1>
  </header>

  <main class="menu-container">
    <div class="menu-item"><a href="<@ofbizUrl controlPath="/DemoPage/control">EditCustomer</@ofbizUrl>">AI Integrated ERP</a></div>
    <div class="menu-item"><a href="<@ofbizUrl controlPath="/AuditReport/control">main</@ofbizUrl>">ISO Audit Pro</a></div>
    <div class="menu-item"><a href="<@ofbizUrl controlPath="/PanguAi/control">main</@ofbizUrl>">Reliability Tools</a></div>
  </main>

  <footer class="footer">
    <p>Experience Our Services to Increase your productivity</p>
  </footer>