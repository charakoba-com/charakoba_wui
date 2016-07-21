<app>
  <wui-app-header apptitle={ opts.apptitle.toUpperCase() } />
  <main>
    <wui-app-sidebar
        name="sidebar"
        apptitle={ opts.apptitle }
        live={ status }
    />
    <subapp />
  </main>

  <style scoped>
   main {
     display: flex;
     height: 120%;
   }
   subapp {
     flex: 5;
     padding: 1em;
   }
  </style>

  <script>
   var self = this;
   var observable = riot.observable();
   self.on('update', function(){
     if (self.opts.apptitle!='top') {
       subapp = riot.mount('subapp', 'editable-table', {apptitle: self.opts.apptitle, obs: observable});
       superagent.get(config.apibaseuri + self.opts.apptitle + '/')
                 .end(function(err, res) {
                   status = JSON.parse(res.status);
                   subapp[0].opts.dataset = JSON.parse(res.text);
                   subapp[0].update();
                   self.tags.sidebar.update();
                 });
     }
   });
   observable.on('saved', function() {
     self.update();
   });
   //riotss.route(function(){});
   //riot.route.start(true);
  </script>
</app>
