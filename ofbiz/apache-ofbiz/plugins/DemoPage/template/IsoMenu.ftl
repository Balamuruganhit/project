
<style>
.tile-scroll-wrapper {
  overflow-x: auto;
  height:35rem;
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
  grid-template-rows: repeat(2, 140px); /* 2 rows */
  grid-auto-columns: 380px;
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
div h1{
    text-align:center;
    padding:3rem;
    font-size:2rem !important;
    font-weight:bold;
}
</style>
<div style="height:10rem">
    <h1>ISO Audit Pro</h1>
</div>

<div class="tile-scroll-wrapper">
  <div class="tile-grid">
   <a href="<@ofbizUrl controlPath="/AuditReport/control">config</@ofbizUrl>" class="tile-link blue"> <div > AS9100 Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">irismenu</@ofbizUrl>" class="tile-link purple"> <div >IRIS Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">ListOfReport</@ofbizUrl>" class="tile-link orange"> <div >ISO9001 Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">main</@ofbizUrl>" class="tile-link red"> <div >API Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">main</@ofbizUrl>" class="tile-link magenta"> <div >UAVPro Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">kpi</@ofbizUrl>" class="tile-link pink"> <div>KPI</div></a>
    <!-- Add more tiles -->
  </div>
</div>

<a href="<@ofbizUrl controlPath="/DemoPage/control">main</@ofbizUrl>" class="link blue"> <div > Back To Menu</div></a>

