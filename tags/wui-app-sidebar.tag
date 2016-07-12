<wui-app-sidebar>
  <section class="status">
    API STATUS: <api-dead-or-alive live={ opts.live }/>
  </section>
  <hr/>
  <section>
    <ul>
      <li><a href="#{ opts.app }">{ opts.app.toUpperCase() } TOP</a></li>
    </ul>
  </section>

  <style scoped>
   :scope {
     min-height: 120%;
     flex: 1;
     background: AliceBlue;
     padding: 1em;
     border-right: 	PaleTurquoise solid 2px;
   }
   hr {
     margin: 1em 0;
     border: 2px dashed LightBlue;
   }
   section.status {
     text-align: center;
   }
   li {
     list-style: none;
     font-weight: bold;
   }
   li a:before {
     content: "-";
     padding-right: .25em;
   }
   li a {
     text-decoration: none;
     color: SteelBlue;
   }
  </style>
</wui-app-sidebar>
