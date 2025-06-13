<#-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
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

 g.setShowStartDate(0); // Show/Hide Start Date(0/1)
  g.setShowEndDate(0);
	g.setShowRes(0); // Show/Hide Responsible (0/1)
	g.setShowDur(0); // Show/Hide Duration (0/1)
	g.setShowComp(0); // Show/Hide % Complete(0/1)
  g.setCaptionType('Resource');  // Set to Show Caption (None,Caption,Resource,Duration,Complete)
	g.setDateDisplayFormat('dd/mm/yyyy')
   
fetch('/manufacturing/control/getganttchart')
  .then(res => res.text())
  .then(text => {
    console.log("Raw response:", text);

    // ✅ Remove the leading // prefix properly
    const cleanText = text.replace(/^\/\/\s*/, '');
    console.log("Clean JSON:", cleanText);

    const data = JSON.parse(cleanText);

    if (!data.tasks || data.tasks.length === 0) {
      console.warn("No tasks found");
      return;
    }

    data.tasks.forEach(task => {
      g.AddTaskItem(new JSGantt.TaskItem(
        task.taskNr || task.phaseNr,
        task.taskName || task.phaseName,
        task.estimatedStartDate || '',
        task.estimatedCompletionDate || '',
        task.color || '#00ff00',
        task.url || '',
        0,
        task.resource || '',
        0,
        task.taskName ? 0 : 1,
        task.phaseNr || 0,
        1
      ));
    });

    g.Draw();
  })
  .catch(err => console.error("Error loading Gantt data:", err));


</script>

