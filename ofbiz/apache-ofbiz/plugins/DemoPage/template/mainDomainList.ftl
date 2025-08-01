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
.tile-scroll-wrapper {
  overflow-x: auto;
  height:55rem;
  overflow-y: hidden;
  padding: 20px;
  -ms-overflow-style: none;      /* IE/Edge */
  scrollbar-width: none;         /* Firefox */
}
.tile-scroll-wrapper::-webkit-scrollbar {
  display: none;                 /* Chrome/Safari */
}

.tile-grid {
  display: grid;
  grid-auto-flow: column;
  grid-template-rows: repeat(3, 140px); /* 2 rows */
  grid-auto-columns: 280px;
  gap: 22px;
}

/* Tile styles */

.tile-link {
  text-decoration: none;
  display: block;
  width: 100%;
  height: 100%;
  border-radius: 15px;
  color: white;
  font-weight: bold;
  font-size: 16px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  text-align: center;
}
.tile-link:hover {
  transform: scale(1.08);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  z-index: 10;
  color:white;
}
.tile-link small {
  font-weight: normal;
  font-size: 12px;
}
/* Colors */
.blue    { background-color: #007bff; }
.orange  { background-color: #ff9800; }
.red     { background-color: #f44336; }
.magenta { background-color: #d81b60; }
.pink    { background-color: #e91e63; }
.purple  { background-color: #9c27b0; }
.teal    { background-color: #009688; }
div h1{
    text-align:center;
    padding:3rem;
    font-size:2rem !important;
    font-weight:bold;
}


.link{
    display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  text-align: center;
   color:white;
    width:10rem;
    height:5rem;
    border-radius:10px;
    margin-left:2rem;
}
</style>

<div style="height:10rem">
    <h1>AI Integrated ERP</h1>
</div>
<div class="tile-scroll-wrapper">
  <div class="tile-grid">
   <a href="<@ofbizUrl controlPath="/manufacturing/control">main</@ofbizUrl>" class="tile-link blue"> <div > Manufacturing</div></a>
   <a href="<@ofbizUrl controlPath="/accounting/control">main</@ofbizUrl>" class="tile-link purple"> <div >Accounting</div></a>
   <a href="<@ofbizUrl controlPath="/ordermgr/control">main</@ofbizUrl>" class="tile-link orange"> <div >Order Management</div></a>
   <a href="<@ofbizUrl controlPath="/catalog/control">main</@ofbizUrl>" class="tile-link red"> <div >Product Management</div></a>
   <a href="<@ofbizUrl controlPath="/facility/control">main</@ofbizUrl>" class="tile-link magenta"> <div >Inventory Management</div></a>
   <a href="<@ofbizUrl controlPath="/partymgr/control">main</@ofbizUrl>" class="tile-link pink"> <div>Organisation Management</div></a>
   <a href="<@ofbizUrl controlPath="/sfa/control">main</@ofbizUrl>" class="tile-link purple"> <div >Sales Force Automation</div></a>
   <a href="<@ofbizUrl controlPath="/humanres/control">main</@ofbizUrl>" class="tile-link teal"> <div >Hr Management</div></a>
   <a href="<@ofbizUrl controlPath="/marketing/control">main</@ofbizUrl>" class="tile-link magenta"> <div >Marketing</div></a>
   <a href="<@ofbizUrl controlPath="/projectmgr/control">main</@ofbizUrl>" class="tile-link orange"> <div >Project Management</div></a>
   <a href="<@ofbizUrl controlPath="/assetmaint/control">main</@ofbizUrl>" class="tile-link pink"> <div>Asset Management</div></a>
   
    <!-- Add more tiles -->
  </div>
</div>

<a href="<@ofbizUrl controlPath="/DemoPage/control">main</@ofbizUrl>" class="link blue"> <div > Back To Menu</div></a>
