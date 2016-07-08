<dns-app>
  <h2>DNS</h2>
  <section>
    <api-dead-or-alive live={ live }></api-dead-or-alive>
  </section>
  <section>
    <host-ip-table body={ body }></host-ip-table>
  </section>

  <script>
   this.live = 'DEAD'
   var self = this
   superagent.get(config.apibaseuri + '/dns/')
          .end(function(err, res) {
            self.live = JSON.parse(res.status)
            self.body = JSON.parse(res.text)
            riot.update()
          })
  </script>
</dns-app>
