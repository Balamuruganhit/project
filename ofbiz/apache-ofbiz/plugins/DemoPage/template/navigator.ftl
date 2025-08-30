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

.header {
  background-color: #0c2d7c;
  color: white;
  padding: 0px;
  text-align: center;
  font-size: 1em;
  width:100%;
  height:70px;
  border-top-right-radius:8px;
  border-top-left-radius:8px;
}
.header h1{
    margin:0px;
    text-align:center;
    padding:2%;
    color:white;
}
.menu-container {
    margin-top:2rem;
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 7rem;
  flex-wrap: wrap;
  padding: 20px;
}

.menu-item {
  border: 1px solid #2a38b6ff;
  background-color: #fff;
  padding: 16px 40px;
  border-radius: 12px;
  text-align: center;
  cursor: pointer;
  transition: background-color 0.3s;
 padding:3.5rem;
 display: flex;
  align-items: center;     /* Vertically center */
  justify-content: flex-start; /* Horizontally center */
  gap: 8px;    
  width:19rem;
  font-size:18px;
  color:#000;
  font-weight:600;
  img{
    width:3rem;
    height:3rem;
  }
}

.menu-item:hover {
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  border:0px;
  transform: scale(1.08);
}

.footer {
  margin-top:5%;
  text-align: center;
  padding: 20px;
  font-size: 18px;
  bottom:0%;
  color:rgb(95, 99, 104);
}
.header-main{
 position: absolute;
 width:100%;
 top:0;
 left:0%;

}
.contentarea{
  padding:0px;
  margin:0px
}
.screenlet > .screenlet-body > div{
  margin:0px;
}
a{
    text-decoration:none;
    color:white;
    text-align:center;
}
#company-logo {
      background: url("/helveticus/images/main.jpg") no-repeat center center / cover;
      // min-height: 50px;
      // min-width: 50px;
      border-radius: 0.5rem 0.5rem 0rem 0rem;
      position: relative;
      top: 1.8rem;
      left:1rem;
    
        height:5.2rem;
        width:10rem;
        
      
    }
    .landing{
     margin-bottom:16px;
      font-size:36px;
      color:black;
    }
  
</style>

    
<div class="header-main">
<header class="header">
 <a id="homeButton" style="border-radius:1rem;background:white;" href="<@ofbizUrl controlPath="/DemoPage/control" >main</@ofbizUrl>"><div  id="company-logo">
 </div></a>  
  </header>
  
   <footer class="footer">
   <h2 class="landing" style="font-size:36px;">Power your Business using AI Integrated Pangun Products</h2>
    <p>Experience Our Services to Increase your productivity</p>
  </footer>
  <main class="menu-container">
    <div ><a class="menu-item" href="<@ofbizUrl controlPath="/DemoPage/control">EditCustomer</@ofbizUrl>"><img src="/DemoPage/images/erp.png">AI Integrated ERP</a></div>
    <div ><a class="menu-item" href="<@ofbizUrl controlPath="/DemoPage/control">IsoMenu</@ofbizUrl>"><img src="/DemoPage/images/iso.png">ISO Audit Pro</a></div>
    <div ><a class="menu-item" href="<@ofbizUrl controlPath="/DemoPage/control">ReliabilityMenu</@ofbizUrl>"><img src="/DemoPage/images/relai.jpg">Reliability  Tools</a></div>
  </main>

 

</div>