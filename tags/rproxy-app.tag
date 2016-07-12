<rproxy-app>
  <wui-app-header apptitle="REVERSE PROXY" />
  <main>
    <wui-app-sidebar app="dns" live={live}></wui-app-sidebar>
  </main>
  <section>
    <host-ip-table body={ body }></host-ip-table>
  </section>

  <style>
  </style>

  <script>
   riot.mount('wui-app-sidebar')
   this.live = 'DEAD'
   var self = this
   superagent.get(config.apibaseuri + '/rproxy/')
             .end(function(err, res) {
               self.live = JSON.parse(res.status)
               self.body = JSON.parse(res.text)
               riot.update()
             });
  </script>
</rproxy-app>
