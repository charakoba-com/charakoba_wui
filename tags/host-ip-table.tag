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
   thead tr {
     font-weight: bold;
     border: 1px solid black;
   }
   tbody tr:nth-child(even) {
     background: lightgray;
   }
  </style>
</host-ip-table>
