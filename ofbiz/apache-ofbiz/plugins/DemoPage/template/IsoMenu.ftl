
<style>
.tile-scroll-wrapper {
  overflow-x: auto;
  overflow-y: hidden;
  padding: 20px;
  -ms-overflow-style: none;      /* IE/Edge */
  scrollbar-width: none;         /* Firefox */
}
.tile-scroll-wrapper::-webkit-scrollbar {
  display: none;                 /* Chrome/Safari */
}

.tile-grid {
  display: flex;
  flex-wrap:wrap;
  gap:20px;
  flex-direction:row;
  align-items: center;
  justify-content: center;
  <#--  grid-auto-flow: column;
  grid-template-rows: repeat(3, 140px); /* 2 rows */
  grid-auto-columns: 280px;
  gap: 22px;  -->
img{
    width:3rem;
    height:3rem;
  }
}

/* Tile styles */

.tile-link {
  border: 1px solid #2a38b6ff;
    background-color: #fff;
    padding: 16px 40px;
    border-radius: 12px;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s;
    padding: 3.5rem;
    display: flex;
    align-items: center;
    justify-content: start;
    gap: 8px;
    width:30rem;
    font-size: 18px;
    color: #000;
    font-weight: 600;

}
.tile-link:hover {
 
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  border:0px;
  transform: scale(1.03);

}
.tile-link small {
  font-weight: normal;
  font-size: 12px;
}
/* Colors */
.blue    { background-color: #f4f3f0; }
.orange  { background-color: #f4f3f0; }
.red     { background-color: #f4f3f0; }
.magenta { background-color: #f4f3f0; }
.pink    { background-color: #f4f3f0; }
.purple  { background-color: #f4f3f0; }
.teal    { background-color: #f4f3f0; }
.header h1{
    margin:0px;
    text-align:center;
    padding:2%;
    color:white;
}

.link{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    text-align: center;
    color:black;
    width: 10rem;
    background-color: #264387ff;
    /* height: 5rem; */
    padding: 15px;
    border-radius: 100px;
    margin-left:2rem;
    color:white;
}
.link:hover{
  color:white;
}

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
    .contentarea{
  padding:0px;
  margin:0px
}
.screenlet > .screenlet-body > div{
  margin:0px;
}
.screenlet > .screenlet-body{
  padding: 0rem;
}
.footer {
  margin-top:2%;
  text-align: center;
  padding: 20px;
  font-size: 18px;
  bottom:0%;
  color:rgb(95, 99, 104);
}
.header-main{
      background: #f2f3f7
}
</style>
<div class="header-main">
<header class="header">
  <a id="homeButton" style="border-radius:1rem;background:white;" href="<@ofbizUrl controlPath="/DemoPage/control" >main</@ofbizUrl>"><div  id="company-logo">
  </div></a>  
    </header>
    <footer class="footer">
   <h2 class="landing" style="font-size:36px;">Iso Audit Pro</h2>
    
  </footer>
<div class="tile-scroll-wrapper">
  <div class="tile-grid">
 <div class="tile-grid">
   <a href="<@ofbizUrl controlPath="/AuditReport/control">As9100Land</@ofbizUrl>" class="tile-link blue"><img src="/DemoPage/images/manufacturing.jpg"> <div > AS9100 Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">irismenu</@ofbizUrl>" class="tile-link purple"> <img src="/DemoPage/images/manufacturing.jpg"><div >IRIS Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">ListOfReport</@ofbizUrl>" class="tile-link orange"> <img src="/DemoPage/images/manufacturing.jpg"><div >ISO9001 Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">main</@ofbizUrl>" class="tile-link red"> <img src="/DemoPage/images/manufacturing.jpg"><div >API Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">main</@ofbizUrl>" class="tile-link magenta"> <img src="/DemoPage/images/manufacturing.jpg"><div >UAVPro Reporting</div></a>
   <a href="<@ofbizUrl controlPath="/AuditReport/control">kpi</@ofbizUrl>" class="tile-link pink"><img src="/DemoPage/images/manufacturing.jpg"> <div>KPI</div></a>
    
    <!-- Add more tiles -->
  </div>

</div>
<a style="margin-top:4rem;" href="<@ofbizUrl controlPath="/DemoPage/control">main</@ofbizUrl>" class="link blue"> <div > Back To Menu</div></a>
</div>
  
