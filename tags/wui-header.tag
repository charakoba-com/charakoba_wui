<wui-header>
  <header>
    <h1><a href="#">charakoba</a></h1>
    <nav>
      <ul>
        <li><a href="#">INDEX</a></li>
        <li><a href="#dns">DNS</a></li>
        <li><a href="#rproxy">REV-PROXY</a></li>
      </ul>
    </nav>
  </header>

  <style scoped>
   header {
     display: flex;
     background: CornflowerBlue;
   }
   header h1 {
     flex: 1;
     display: flex;
     align-items: center;
     padding-left: 1em;
     color: Lavender;
   }
   header h1 a {
     color: Lavender;
     text-decoration: none;
   }
   header nav {
     flex: 1;
     display: flex;
     justify-content: flex-end;
     font-weight: bold;
   }
   header nav ul {
     display: flex;
   }
   header nav ul li {
     list-style: none;
     display: flex;
     align-items: center;
     justify-content: center;
     transition: background .25s ease;
   }
   header nav ul li:hover {
     background: RoyalBlue;
     transition: background .25s ease;
   }
   header nav ul li a {
     text-decoration: none;
     color: white;
     padding: 1em 1em;
   }
  </style>
</wui-header>
