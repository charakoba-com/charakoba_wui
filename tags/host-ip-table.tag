<host-ip-table>
  <table>
    <thead>
      <tr>
        <td>Host</td>
        <td>IP Address</td>
      </tr>
    </thead>
    <tbody>
      <tr each={ data in opts.body }>
        <td>{ data.host }</td>
        <td>{ data.ipaddress }</td>
      </tr>
    </tbody>
  </table>

  <style scoped>
   table {
     border: 1px solid black;
   }
  </style>
</host-ip-table>
