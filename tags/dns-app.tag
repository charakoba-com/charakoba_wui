<dns-app>
  <wui-app-header apptitle="DNS" />
  <main>
    <wui-app-sidebar app="dns" live={ live }/>
    <dns-subapp></dns-subapp>
  </main>

  <style>
   main {
     display: flex;
     height: 100%;
   }
   dns-subapp {
     flex: 5;
     padding: 1em;
   }
  </style>

  <script>
   riot.mount('wui-app-sidebar');
   var self = this
   this.live = '200'
   superagent.get(config.apibaseuri + '/dns/')
             .end(function(err, res) {
               self.live = JSON.parse(res.status);
               self.body = JSON.parse(res.text);
               riot.update();
             });
   riot.route(function(app, subapp){
     riot.mount('dns-subapp', 'host-ip-table', {body: self.body});
     riot.update();
   });
   riot.route.start(true)
  </script>
</dns-app>
