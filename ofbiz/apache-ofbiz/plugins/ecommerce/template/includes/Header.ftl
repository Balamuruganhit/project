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
<script>
$(document).ready(function() {
  if (jQuery.fn.bsgdprcookies !== undefined) {
    jQuery('body').bsgdprcookies({
        title: '${uiLabelMap.EcommerceCookieConsentTitle}',
        message: '${uiLabelMap.EcommerceCookieConsentMessage}',
        moreLink: '/ecommerce/control/CookiePolicy',
        moreLinkLabel: ' ${uiLabelMap.EcommerceCookieConsentMoreLinkLabel}',
        acceptButtonLabel: '${uiLabelMap.EcommerceCookieConsentAcceptButtonLabel}',
        advancedButtonLabel: '${uiLabelMap.EcommerceCookieConsentAdvancedButtonLabel}',
        allowAdvancedOptions: false
    });
  }
});
</script>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarContent">
    <ul class="navbar-nav mr-auto">
      <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>logout</@ofbizUrl>">${uiLabelMap.CommonLogout}</a>
        </li>
      <#else>
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>">${uiLabelMap.CommonLogin}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>newcustomer</@ofbizUrl>">${uiLabelMap.EcommerceRegister}</a>
        </li>
      </#if>
      
      <li class="nav-item">
        <a class="nav-link" href="<@ofbizUrl>main</@ofbizUrl>">${uiLabelMap.CommonMain}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<@ofbizUrl>liveTempTracker</@ofbizUrl>">Live Temp Tracker</a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <#if !userLogin?has_content || (userLogin.userLoginId)! != "anonymous">
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>viewprofile</@ofbizUrl>">${uiLabelMap.CommonProfile}</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>Party</@ofbizUrl>">Party</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<@ofbizUrl>inventory</@ofbizUrl>">Inventory</a>
        </li>
        
      </#if>
      <#if catalogQuickaddUse>
        <li class="nav-item"><a class="nav-link" href="<@ofbizUrl>quickadd</@ofbizUrl>">${uiLabelMap.CommonQuickAdd}</a></li>
      </#if>
    </ul>
  </div>
</nav>
<div style="margin:1rem;"></div>
<div class="container-fluid">
  <div class="row align-items-center">
    <div class="col text-center d-none d-lg-block">
      <#if !productStore??>
            <h3>${uiLabelMap.EcommerceNoProductStore}</h3>
          </#if>
          
            <h3>FeatherFlow</h3>
          
          
            <div id="company-subtitle">Part of the PoultryTech Family of Smart Farming Solutions</div>
          
          <div>
            <#if sessionAttributes.autoName?has_content>
              <span class="text-success">${uiLabelMap.CommonWelcome}&nbsp;${sessionAttributes.autoName}!</span>
              
              
            <#else>
              ${uiLabelMap.CommonWelcome}!
            </#if>
          </div>
    </div>
    
  </div>
</div>







