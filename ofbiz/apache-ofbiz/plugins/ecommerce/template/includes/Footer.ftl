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

<#assign nowTimestamp = Static["org.apache.ofbiz.base.util.UtilDateTime"].nowTimestamp()>

<div class="footer-block">
<div class="d-flex justify-content-center">
  
  <div class="p-2 text-center">
    <a href="//ofbiz.apache.org">${uiLabelMap.EcommerceAboutUs}</a>
    <div>Copyright &copy; 2001-${nowTimestamp?string("yyyy")} The Apache Software Foundation -
      <a href="//www.apache.org">www.apache.org</a>
    </div>
    <div>Powered by <a href="//ofbiz.apache.org">Spartenz</a></div>
  </div>
  
</div>
</div>
