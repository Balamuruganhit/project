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

<#escape x as x?xml>
<#assign pageLayoutName = "simple-landscape">
<#if femaOutputTitle?has_content ><fo:block-container width="35cm" height="20cm">
    <fo:block font-size="12pt">This is custom content inside a container</fo:block>

  
    <fo:table table-layout="fixed" border="1pt solid" padding="5pt" width="50cm" border-width=".1mm" >
        <fo:table-body>
            <fo:table-row >
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block padding="3.4pt">Drawing:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            <fo:block>${femaOutputTitle.drawing}</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Part No:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt">
                            
                           
                                <fo:block>${femaOutputTitle.part}</fo:block>
                           
                        </fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Rev:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${femaOutputTitle.rev}</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>FEMA No:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${femaOutputTitle.femaId}</fo:block></fo:table-cell>
            </fo:table-row>
            <fo:table-row >
                       <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>System Subsystem Components::</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${femaOutputTitle.comp}</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Design Responsibility::</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt" ><fo:block>${femaOutputTitle.design}</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" font-weight="bold" padding="3.4pt"><fo:block>Prepared By:</fo:block></fo:table-cell>
                        <fo:table-cell border="1pt solid black" padding="3.4pt"><fo:block>${femaOutputTitle.prepareField}</fo:block></fo:table-cell>
            </fo:table-row>
            
        </fo:table-body>
    </fo:table>
    </fo:block-container>
    
</#if>
</#escape>