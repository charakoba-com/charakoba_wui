<wui-app-sidebar>
  <section class="status">
    API STATUS: <api-dead-or-alive live={ opts.live || 'DEAD' }/>
  </section>
  <hr/>
  <section>
    <ul>
      <li><a href="#{ opts.apptitle }">{ opts.apptitle.toUpperCase() } TOP</a></li>
      <ul class="nested_list">
        <li each={ menuitem in menulist }><a href="#{ opts.apptitle }/{ menuitem }">{ menuitem }</a></li>
      </ul>
    </ul>
  </section>

  <style scoped>
   :scope {
     height: 120%;
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
   ul.nested_list li a:before {
     content: "+";
     padding-left: .5em;
   }
  </style>
</wui-app-sidebar>
