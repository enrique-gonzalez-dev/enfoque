  var notOrderable = [];
  var notVisible = [];
  var notSearchable = [];
  var mainCol = 0;
  var mainDir = "desc";
  var titleval = $("#table").data("export");
  var title = "tabla";
  if (titleval != null && titleval != "undefined")
      title = titleval;

  $('#table').find('th').each(function($index) {
      var oo = $(this).data("orderable");
      var vv = $(this).data("visible");
      var ss = $(this).data("searchable");
      var ac = $(this).data("action");
      var mm = $(this).data("main");

      // ACTION
      // if marked as action column, it is considered as Visible, Not-Orderable and Not-Searchable
      if (ac == true) {
          notOrderable.push($index);
          notSearchable.push($index);
          return true;
      }

      // ORDERABLE - by default is true
      if (oo == false) {
          notOrderable.push($index);
      }

      // SEARCHABLE - by default is true
      if (ss == false) {
          notSearchable.push($index);
      }

      // VISIBLE - by default is true
      if (vv == false) {
          notVisible.push($index);
      }

      if (mm == true) {
          mainCol = $index;
          mainDir = $(this).data("order");
      }

  });
  $('#table-1').find('th').each(function($index) {
      var oo = $(this).data("orderable");
      var vv = $(this).data("visible");
      var ss = $(this).data("searchable");
      var ac = $(this).data("action");
      var mm = $(this).data("main");

      // ACTION
      // if marked as action column, it is considered as Visible, Not-Orderable and Not-Searchable
      if (ac == true) {
          notOrderable.push($index);
          notSearchable.push($index);
          return true;
      }

      // ORDERABLE - by default is true
      if (oo == false) {
          notOrderable.push($index);
      }

      // SEARCHABLE - by default is true
      if (ss == false) {
          notSearchable.push($index);
      }

      // VISIBLE - by default is true
      if (vv == false) {
          notVisible.push($index);
      }

      if (mm == true) {
          mainCol = $index;
          mainDir = $(this).data("order");
      }

  });
  $('#table-2').find('th').each(function($index) {
      var oo = $(this).data("orderable");
      var vv = $(this).data("visible");
      var ss = $(this).data("searchable");
      var ac = $(this).data("action");
      var mm = $(this).data("main");

      // ACTION
      // if marked as action column, it is considered as Visible, Not-Orderable and Not-Searchable
      if (ac == true) {
          notOrderable.push($index);
          notSearchable.push($index);
          return true;
      }

      // ORDERABLE - by default is true
      if (oo == false) {
          notOrderable.push($index);
      }

      // SEARCHABLE - by default is true
      if (ss == false) {
          notSearchable.push($index);
      }

      // VISIBLE - by default is true
      if (vv == false) {
          notVisible.push($index);
      }

      if (mm == true) {
          mainCol = $index;
          mainDir = $(this).data("order");
      }

  });

  $(function() {
      $('#table').DataTable({
          responsive: true,
          order: [
              [mainCol, mainDir]
          ],
          dom: "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
              "<'row'<'col-sm-12'tr>>" +
              "<'row'<'col-sm-5'i><'col-sm-7'p>>",
          buttons: [{
              extend: 'excel',
              filename: title,
              text: 'Descargar en Excel'
          }],
          columnDefs: [{
                  "targets": notVisible,
                  "visible": false,
              },
              {
                  "targets": notSearchable,
                  "searchable": false,
              },
              {
                  "targets": notOrderable,
                  "orderable": false
              }
          ],

          language: {
              "lengthMenu": "Mostrar _MENU_ elementos por página",
              "zeroRecords": "No se han encontrado coincidencias",
              "info": "Registros del <b>_START_ al _END_</b> de _TOTAL_ totales",
              "infoEmpty": "Mostrando 0 elementos",
              "emptyTable": "No existen datos para mostrar",
              "infoFiltered": "(filtrado de _MAX_ existentes)",
              "search": "Buscar:",

              "paginate": {
                  "first": "<<",
                  "last": ">>",
                  "previous": "<",
                  "next": ">",
              }
          }
      });
  });
  $(function() {
      $('#table-1').DataTable({
          responsive: true,
          order: [
              [mainCol, mainDir]
          ],
          dom: "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
              "<'row'<'col-sm-12'tr>>" +
              "<'row'<'col-sm-5'i><'col-sm-7'p>>",
          buttons: [{
              extend: 'excel',
              filename: title,
              text: 'Descargar en Excel'
          }],
          columnDefs: [{
                  "targets": notVisible,
                  "visible": false,
              },
              {
                  "targets": notSearchable,
                  "searchable": false,
              },
              {
                  "targets": notOrderable,
                  "orderable": false
              }
          ],

          language: {
              "lengthMenu": "Mostrar _MENU_ elementos por página",
              "zeroRecords": "No se han encontrado coincidencias",
              "info": "Registros del <b>_START_ al _END_</b> de _TOTAL_ totales",
              "infoEmpty": "Mostrando 0 elementos",
              "emptyTable": "No existen datos para mostrar",
              "infoFiltered": "(filtrado de _MAX_ existentes)",
              "search": "Buscar:",

              "paginate": {
                  "first": "<<",
                  "last": ">>",
                  "previous": "<",
                  "next": ">",
              }
          }
      });
  });
  $(function() {
      $('#table-2').DataTable({
          responsive: true,
          order: [
              [mainCol, mainDir]
          ],
          dom: "<'row'<'col-sm-3'l><'col-sm-6 text-center'B><'col-sm-3'f>>" +
              "<'row'<'col-sm-12'tr>>" +
              "<'row'<'col-sm-5'i><'col-sm-7'p>>",
          buttons: [{
              extend: 'excel',
              filename: title,
              text: 'Descargar en Excel'
          }],
          columnDefs: [{
                  "targets": notVisible,
                  "visible": false,
              },
              {
                  "targets": notSearchable,
                  "searchable": false,
              },
              {
                  "targets": notOrderable,
                  "orderable": false
              }
          ],

          language: {
              "lengthMenu": "Mostrar _MENU_ elementos por página",
              "zeroRecords": "No se han encontrado coincidencias",
              "info": "Registros del <b>_START_ al _END_</b> de _TOTAL_ totales",
              "infoEmpty": "Mostrando 0 elementos",
              "emptyTable": "No existen datos para mostrar",
              "infoFiltered": "(filtrado de _MAX_ existentes)",
              "search": "Buscar:",

              "paginate": {
                  "first": "<<",
                  "last": ">>",
                  "previous": "<",
                  "next": ">",
              }
          }
      });
  });