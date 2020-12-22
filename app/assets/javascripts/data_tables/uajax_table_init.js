  var notOrderableAjax = [];
  var notVisibleAjax = [];
  var notSearchableAjax = [];
  var columnsNamesAjax = [];
  var colorablesAjax = [];
  var mainColAjax = 0;
  var mainDirAjax = "desc";
  var MainTable = "";
  var usesColored = false;
  var titlevalAjax = $("#ajax-datatable").data("export");
  var titleAjax = "tabla";
  var searchEnabled = $("#ajax-datatable").data("enable-search");
  if(titlevalAjax != null && titlevalAjax != "undefined")
       titleAjax = titlevalAjax;

  if(searchEnabled == null && searchEnabled == "undefined")
       searchEnabled = true;

  $('#ajax-datatable').find('th').each(function($index){
    var oo = $(this).data("orderable");
    var vv = $(this).data("visible");
    var ss = $(this).data("searchable");
    var ac = $(this).data("action");
    var mm = $(this).data("main");
    var cname = $(this).data("name");

    var colorable = $(this).data("colorable");

    var col = {data: cname};
    columnsNamesAjax.push(col);
    // ACTION
    // if marked as action column, it is considered as Visible, Not-Orderable and Not-Searchable
    if(ac == true) {
      notOrderable.push($index);
      notSearchable.push($index);
      return true;          
    }

    // ORDERABLE - by default is true
    if(oo == false) {
      notOrderable.push($index);
    }

    // SEARCHABLE - by default is true
    if(ss == false) {
      notSearchable.push($index);
    }

    // VISIBLE - by default is true
    if(vv == false) {
      notVisible.push($index);
    }

    if(mm == true)
    {
      mainCol = $index;
      mainDir = $(this).data("order");
    }

    if(colorable == true)
    {
       colorablesAjax.push($index);
    }

  });

  $(function() {

    if (colorablesAjax.length > 0) {
      usesColored = true;
    }

    MainTable = $('#ajax-datatable').DataTable({
      "processing": true,
      "serverSide": true,
      "searching": searchEnabled,
      "ajax": $('#ajax-datatable').data('source'),
      aLengthMenu: [
          [25, 50, 100],
          [25, 50, 100]
      ],
      iDisplayLength: 25,
      responsive: true,
      order: [[ mainCol, mainDir ]],
      columnDefs: [
        {
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
        }],
        // función para dar color a columnas
        "createdRow": function ( row, data, index ) {
          if (usesColored) {
            for (var i = 0; i < colorablesAjax.length; i++) {
              var ccc = colorablesAjax[i];
              var ppp = columnsNamesAjax[ccc].data;              
              var vvv = data[ppp].replace(" ", "_").toLowerCase();
              $('td', row).eq(ccc).addClass('colorable ' + columnsNamesAjax[ccc].data + ' ' + vvv);
            }
          }
        },

      "columns": columnsNamesAjax,

      "language": 
        {
            "sProcessing":     "Procesando...",
            "sLengthMenu":     "Mostrar _MENU_ elementos por página",
            "sZeroRecords":    "No se han encontrado coincidencias",
            "sEmptyTable":     "Ningún dato disponible en esta tabla",
            "sInfo":           "Registros del <b>_START_ al _END_</b> de _TOTAL_ totales",
            "sInfoEmpty":      "Mostrando 0 elementos",
            "sInfoFiltered":   "(filtrado de _MAX_ existentes)",
            "sInfoPostFix":    "",
            "sSearch":         "Buscar:",
            "sUrl":            "",
            "sInfoThousands":  ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst":    "<<",
                "sLast":     ">>",
                "sNext":     ">",
                "sPrevious": "<"
            },
            "oAria": {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
  });