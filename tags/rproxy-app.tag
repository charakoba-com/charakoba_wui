<rproxy-app>
  <wui-app-header apptitle="REVERSE PROXY" />
  <section>
    <api-dead-or-alive live={ live }></api-dead-or-alive>
  </section>
  <section>
    <host-ip-table body={ body }></host-ip-table>
  </section>

  <script>
   this.live = 'DEAD'
   var self = this
   superagent.get(config.apibaseuri + '/rproxy/')
             .end(function(err, res) {
               self.live = JSON.parse(res.status)
               self.body = JSON.parse(res.text)
               riot.update()
             })
  </script>
</rproxy-app>
