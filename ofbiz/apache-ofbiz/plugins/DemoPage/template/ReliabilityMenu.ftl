
<style>
.header-main{
 position: absolute;
 width:99%;
 top:0;
 left:0.3%;
 background:white;
}
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
   color:white;
    width:10rem;
    height:5rem;
    border-radius:10px;
    margin-left:2rem;
}
.link:hover{
  color:white;
  transform: scale(1.08);
}
.header {
  background-color: #0c2d7c;
  color: white;
  padding: 0px;
  text-align: center;
  font-size: 1em;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  width:100%;
}
</style>
<div class="header-main">
<header class="header">
    <h1 style="color:white">Reliability Tools</h1>
  </header>
<div class="tile-scroll-wrapper">
  <div class="tile-grid">
  <a href="<@ofbizUrl controlPath="/PanguAi/control">findfracas</@ofbizUrl>" class="tile-link blue"> <div > FRACAS</div></a>
   <a href="<@ofbizUrl controlPath="/PanguAi/control">main</@ofbizUrl>" class="tile-link purple"> <div >RCA-8D</div></a>
    <a href="<@ofbizUrl controlPath="/PanguAi/control">ramsSelector</@ofbizUrl>" class="tile-link red"> <div >RAMS</div></a>
    <a href="<@ofbizUrl controlPath="/PanguAi/control">selector</@ofbizUrl>" class="tile-link orange"> <div >FMEA</div></a>
  
   <a href="<@ofbizUrl controlPath="/PanguAi/control">main</@ofbizUrl>" class="tile-link magenta"> <div >LCC</div></a>

    <!-- Add more tiles -->
  </div>

</div>
  <a style="margin-bottom:2rem;" href="<@ofbizUrl controlPath="/DemoPage/control">main</@ofbizUrl>" class="link blue"> <div > Back To Menu</div></a>

</div>