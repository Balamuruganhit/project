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
<#assign contextPath = request.getContextPath()>
<#if contextPath?contains("DemoPage")>

    <#else>
<div class="botHolder">
<img class="botImg" src="/helveticus/images/bot-removebg.png" id="bot-img" alt="hello">
<div class="chat-container" id="chat-holder">
    <button id="close-btn">X</button>
    <div id="chat-box" class="chat-box">
      <!-- Messages will be dynamically added here -->
    </div>
   
    <div class="chat-input">
        <input type="text" id="user-input" placeholder="Type your message here..." />
        <button id="send-btn">Send</button>
    </div>
</div>
</div>
<div id="footer-offset"></div>
<div id="footer">
    <span>${nowTimestamp?datetime?string.short} - <a href="<@ofbizUrl>ListTimezones</@ofbizUrl>">${timeZone.toZoneId().getDisplayName(Static["java.time.format.TextStyle"].FULL_STANDALONE, locale)}</a></span>
    <span> ${uiLabelMap.CommonCopyright} (c)  2023-${nowTimestamp?string("yyyy")}
        <a href=""http://www.pangun.tech"" target="_blank">Pangun Technologies</a>.
       Powered by <a href="http://www.pangun.tech" class="noicon">Pangun NeoERP </a>
    </span>
</div>
</div>
<#if layoutSettings.VT_FTR_JAVASCRIPT?has_content>
  <#list layoutSettings.VT_FTR_JAVASCRIPT as javaScript>
    <script type="application/javascript" src="<@ofbizContentUrl>${StringUtil.wrapString(javaScript)}</@ofbizContentUrl>"></script>
  </#list>
</#if>
<@scriptTagsFooter/>
</body>
</html>
</#if>