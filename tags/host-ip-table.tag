<host-ip-table>
  <table>
    <thead>
      <tr>
        <td>Host</td>
        <td>IP Address</td>
      </tr>
    </thead>
    <tbody>
      <tr each={ data,i in opts.body } id="row{i}">
        <td>{ data.host }</td>
        <td>{ data.ipaddress }</td>
        <td><a href="#dns/{i}">edit</a></td>
      </tr>
    </tbody>
  </table>

  <style scoped>
   thead tr {
     font-weight: bold;
     border: 1px solid black;
   }
   tbody tr:nth-child(even) {
     background: darkgray;
   }
   tbody tr td {
     padding: .25em 1em;
     width: 20em;
   }
   tbody tr:nth-child(even) td {
     color: White;
   }
   tbody tr td:last-child {
     width: 5em;
     text-align: center;
     padding: 0;
   }
   tbody tr td a {
     display: inline-block;
     text-decoration: none;
     width: 100%;
   }
   tbody tr:nth-child(even) td:last-child a {
     color: white;
   }
  </style>

  <script>
   var self = this;
   riot.route(function(app, edit) {
     if(edit){
       riot.mount("#row"+edit, "dns-edit-row", {i: edit, body: self.opts.body[edit]});
       riot.update();
     }else{
     }
   });
   riot.route.start(true);
  </script>
</host-ip-table>
