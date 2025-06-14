
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


<div style="position:relative" class="gantt" id="GanttChartDIV"></div>
<script type="application/javascript">
var g = new JSGantt.GanttChart('g',document.getElementById('GanttChartDIV'), 'hour');
const startTime = performance.now();
 g.setShowStartDate(0); // Show/Hide Start Date(0/1)
  g.setShowEndDate(0);
	g.setShowRes(0); // Show/Hide Responsible (0/1)
	g.setShowDur(0); // Show/Hide Duration (0/1)
	g.setShowComp(0); // Show/Hide % Complete(0/1)
  g.setCaptionType('Resource');  // Set to Show Caption (None,Caption,Resource,Duration,Complete)
	g.setDateDisplayFormat('dd/mm/yyyy')
const allTasks = [
<#list phaseTaskList as t>
    <#if "PHASE" == t.workEffortTypeId>
        new JSGantt.TaskItem("${t.phaseNr}", "${t.phaseSeqNum!}. ${t.phaseName}", "", "", "00ff00", "", 0, "", 0, 1, 0, 1),
    </#if>
    <#if "TASK" == t.workEffortTypeId>
        new JSGantt.TaskItem("${t.taskNr}","${t.taskSeqNum!}. ${t.taskName}","${StringUtil.wrapString(t.estimatedStartDate)}", "${StringUtil.wrapString(t.estimatedCompletionDate)}","${t.color}", "${t.url}", 0 , "${t.resource!}", "${t.completion!}" , 0, "", 1, "" ),
    </#if>
    <#if "MILESTONE" == t.workEffortTypeId>
        new JSGantt.TaskItem(new JSGantt.TaskItem("${t.taskNr}","${t.taskName}","${StringUtil.wrapString(t.estimatedStartDate)}", "${StringUtil.wrapString(t.estimatedCompletionDate)}","00ff00", "", 1 , "${t.resource!}", "${t.completion!}" , 0,"", "", "" ));
    </#if>
</#list>
]
const batchSize = 50;
  let index = 0;


  function addTasksInChunks(deadline) {
    while (index < allTasks.length && deadline.timeRemaining() > 0) {
      const end = Math.min(index + batchSize, allTasks.length);
      for (let i = index; i < end; i++) {
        g.AddTaskItem(allTasks[i]);
      }
      index = end;

      // Optional: Show loading progress
    }

    if (index < allTasks.length) {
      requestIdleCallback(addTasksInChunks);
    } else {
      g.Draw();
      g.DrawDependencies();
    }
  }

  requestIdleCallback(addTasksInChunks);
</script>