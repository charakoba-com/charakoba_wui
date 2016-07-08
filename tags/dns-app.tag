<dns-app>
  <h2>DNS</h2>
  <section>
    { live }
  </section>

  <script>
   this.live = 'DEAD'
   var self = this
   superagent.get(config.baseuri + '/dns/')
          .end(function(err, res) {
            self.live = JSON.parse(res.status)
            riot.update()
          })
  </script>
</dns-app>
