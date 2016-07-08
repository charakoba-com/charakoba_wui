<rproxy-app>
  <h2>REVERSE PROXY</h2>
  <section>
    { live }
  </section>

  <script>
   var self = this
   superagent.get(config.baseuri + '/rproxy/')
             .end(function(err, res) {
               self.live = JSON.parse(res.status)
               riot.update()
             })
  </script>
</rproxy-app>
