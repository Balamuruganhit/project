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
<fo:table>
    <fo:table-column column-number="1" column-width="proportional-column-width(15)"/>
    <fo:table-column column-number="2" column-width="proportional-column-width(25)"/>
    <fo:table-column column-number="3" column-width="proportional-column-width(15)"/>
    <fo:table-column column-number="4" column-width="proportional-column-width(25)"/>
    <fo:table-column column-number="5" column-width="proportional-column-width(20)"/>
    <fo:table-body>
        <#if resultList?? && resultList?size > 0>
            <#list resultList as listOfReport>
                <fo:table-row>
                    <fo:table-cell><fo:block>${listOfReport.reportId}</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>${listOfReport.question}</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>${listOfReport.rating}</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>${listOfReport.comment}</fo:block></fo:table-cell>
                    <fo:table-cell>
                        <#if listOfReport.image?? && listOfReport.image != "">
                            <fo:block>
                                <fo:external-graphic src="${listOfReport.image}" alt="Image" width="100px"/>
                            </fo:block>
                        <#else>
                            <fo:block>No Image</fo:block>
                        </#if>
                    </fo:table-cell>
                </fo:table-row>
            </#list>
        <#else>
            <fo:table-row>
                <fo:table-cell colspan="5"><fo:block>No data available</fo:block></fo:table-cell>
            </fo:table-row>
        </#if>
    </fo:table-body>
</fo:table>

