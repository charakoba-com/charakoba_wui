<editable-table>
  <section>
    <table>
      <thead>
        <tr>
          <td each={ key in Object.keys(opts.dataset[0]).reverse() }>{ key }</td>
        </tr>
      </thead>
      <tbody>
        <tr each={ data, idx in opts.dataset} id="row{idx}">
          <td>{ data[keys[0]] }</td>
          <td>{ data[keys[1]] }</td>
          <td class="edit"><a href="#{opts.apptitle}" onclick={ editHandler }>edit</a></td>
        </tr>
      </tbody>
    </table>
  </section>

  <style scoped>
   table thead tr td {
     color: DarkBlue;
     font-weight: bold;
     padding: .25em;
   }
   table tbody tr:nth-child(odd) {
     background: Lavender;
   }
   table tbody tr td {
     padding: .5em;
     width: 20em;
   }
   table tbody tr td.edit {
     width: 5em;
     text-align: center;
   }
   table tbody tr td.edit a{
     text-decoration: none;
     font-weight: bold;
     color: LightSteelBlue;
   }
  </style>

  <script>
   var self = this;
   self.on('update', function(){
     if (self.opts.dataset!==undefined) {
       keys = Object.keys(self.opts.dataset[0]).reverse();
     }
   });

   editHandler(e) {
     riot.mount('#row'+e.item.idx, 'edit-row', {
       apptitle: self.opts.apptitle,
       data: e.item.data,
       keys: keys,
       obs: self.opts.obs
     });
   }
  </script>
</editable-table>

<edit-row>
  <td><input name="{ opts.keys[0] }" type="text" value={ opts.data[opts.keys[0]] }/></td>
  <td><input name="{ opts.keys[1] }" type="text" value="{ opts.data[opts.keys[1]] }"/></td>
  <td class="edit"><a href="#" onclick={ saveHandler }>save</a></td>

  <style>
   input {
     padding: 0;
     margin: 0;
     border: none;
     background: rgba(1,1,1,0.1);
   }
  </style>

  <script>
   var self = this;

   saveHandler(e) {
     that = riot.observable();
     if (self.host.value!=self.opts.data.host) {
       superagent.post(config.apibaseuri + '/' + self.opts.apptitle + '/hosts/')
                 .set('Content-Type', 'application/x-www-form-urlencoded')
                 .send({host: self.opts.data.host, new_host: self.host.value})
                 .end(function(err, res) {
                   that.trigger('next', 1);
                 });
     }else{
       that.trigger('next', 1);
     }

     that.on('next', function(i){
       if (i==2){
         self.opts.obs.trigger('saved');
       } else if (self[self.opts.keys[i]].value!=self.opts.data[self.opts.keys[i]]) {
         var update = {host: self.host.value}
         update['new_' + self.opts.keys[i]] = self[self.opts.keys[i]].value;
         superagent.post(config.apibaseuri + '/' + self.opts.apptitle + '/' + self.opts.keys[i] + '/')
                   .set('Content-Type', 'application/x-www-form-urlencoded')
                   .send(update)
                   .end(function(err, res) {
                     that.trigger('next', 2);
                   });
       } else {
         that.trigger('all', 2);
       }
     });

     that.on('all', function(event, arg) {
       console.log(event);
       console.log(arg);
       that.trigger('all', arg+1);
     });
   }
  </script>
</edit-row>
