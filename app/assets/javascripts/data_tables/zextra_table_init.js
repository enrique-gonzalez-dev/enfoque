  var notOrderableEx = [];
  var notVisibleEx = [];
  var notSearchableEx = [];
  var mainColEx = 0;
  var mainDirEx = "desc";

  $('#extra_table').find('th').each(function($index){
    var oo = $(this).data("orderable");
    var vv = $(this).data("visible");
    var ss = $(this).data("searchable");
    var ac = $(this).data("action");
    var mm = $(this).data("main");

    // ACTION
    // if marked as action column, it is considered as Visible, Not-Orderable and Not-Searchable
    if(ac == true) {
      notOrderableEx.push($index);
      notSearchableEx.push($index);
      return true;          
    }

    // ORDERABLE - by default is true
    if(oo == false) {
      notOrderableEx.push($index);
    }

    // SEARCHABLE - by default is true
    if(ss == false) {
      notSearchableEx.push($index);
    }

    // VISIBLE - by default is true
    if(vv == false) {
      notVisibleEx.push($index);
    }

    if(mm == true)
    {
      mainColEx = $index;
      mainDirEx = $(this).data("order");
    }

  });

  $(function() {
    $('#extra_table').DataTable({
      responsive: true,
      order: [[ mainColEx, mainDirEx ]],
      
      columnDefs: [
        {
            "targets": notVisibleEx,
            "visible": false,
        },
        {
            "targets": notSearchableEx,
            "searchable": false,
        },
        {
            "targets": notOrderableEx,
            "orderable": false
        }],

        language: {
            "lengthMenu": "Mostrar _MENU_ elementos por página",
            "zeroRecords": "No se han encontrado coincidencias",
            "info": "Registros del <b>_START_ al _END_</b> de _TOTAL_ totales",
            "infoEmpty": "Mostrando 0 elementos",
            "emptyTable": "No existen datos para mostrar",
            "infoFiltered": "(filtrado de _MAX_ existentes)",
            "search": "Buscar:",

          "paginate": {
            "first":      "<<",
            "last":       ">>",
            "previous":   "<",
            "next":       ">",
          }
        }
    });
  });
