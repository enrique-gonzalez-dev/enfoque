
/* **** For tables *** */

function MvhmpEDQgl(id)
{
    // go to show
    window.location.href = "/" + getController()+ "/" + id;
}

function pJIALbGKJA(id)
{
    // go to edit
    window.location.href = "/" + getController() + "/" + id + "/edit";
}
function pJIALbGKJAA(id)
{
    // go to edit
    window.location.href = "/" + "admins" + "/" + id + "/edit";
}

function WxlBcodAzj(id)
{
    // destroy this stuff
    confirmDelete(id, getController());
}

/* **** End *** */



/* **** For tables with data-info *** */

function MvhmpjkgasdQgl(e)
{
    var id = $(e).data("id");
    var blank = $(e).data("blank");
    // go to show

    if (blank == false)
        window.location.href = "/" + getController()+ "/" + id;    
    else
        window.open("/" + getController()+ "/" + id, '_blank');
}

function MvhmpjkgasdQglPath(e)
{
    var blank = $(e).data("blank");
    var path = $(e).data("path");
    // go to show

    if (blank == false)
        window.location.href = path;
    else
        window.open(path, '_blank');
}

function pJjghadsASD(e)
{
    var id = $(e).data("id");
    // go to edit
    window.location.href = "/" + getController() + "/" + id + "/edit";
}

function xxvkSdfDkbd(e)
{
    var id = $(e).data("id");
    var verb = $(e).data("verb");
    // go to edit
    window.location.href = "/" + getController() + "/" + id + "/" + verb;
}


function xxvkSdfDkbdPath(e)
{
    var verb = $(e).data("verb");
    var path = $(e).data("path");
    // go to edit
    window.location.href = path + "/" + verb;
}

function WxlBcodAzjsadW(e)
{
    var id = $(e).data("id");
    // destroy this stuff
    confirmDelete(id, getController());
}

function cxlBcAeRfSaGAweWadx(e)
{
    var id = $(e).data("id");
    // destroy this stuff, redirect to index
    confirmDeleteCustom(id, getController());
}

/* **** End *** */



/* **** For show-view *** */
function MpFGsTPjhb()
{
    // new object like this
    window.location.href = "/" + getController() + "/new";
}

function MpFGcxqqPjhb()
{
    // new object like this
    var url = "/" + getController();
    var prefix = getPrefix();
    var action = getAction();
    if(prefix != "")
    {
        url += "/";
        url += prefix;
    }

    if(action != "")
    {
        url += "/";
        url += action;
    }

    window.location.href = url;
}

function eBYtetFUFs(id)
{
    // destroy this stuff, redirect to index
    confirmDeleteCustom(id, getController());
}
/* **** End *** */

var deleteCaller = function(id, controller){
  $.ajax({
    type:'DELETE',
    url:'/' + controller + '/' + id,
    dataType: "json",
    data:
    {},

    success:function(data)
    {
     // var tt = JSON.stringify(data);
        if (data != null)
        {
            var status = data['status'];
            if (status == false)
                errorDeletion(data['error']);
            else
              successDeletion();    
        }
        else
        {
            successDeletion();   
        }
    }
  });
}

var deleteCallerCustom = function(id, controller){
  $.ajax({
    type:'DELETE',
    url:'/' + controller + '/' + id,
    dataType: "json",
    data:
    {},

    success:function(data)
    {
        if (data != null)
        {
            var status = data['status'];
            if (status == false)
                errorDeletion(data['error']);
            else
              successDeletionCustom();
        }
        else
        {
            successDeletionCustom();
        }

     // var tt = JSON.stringify(data);
    }
  });
}

// Confirmation message
function confirmDelete(id, controller)
{
    swal({   
        title: "¿Está seguro?",   
        text: getDeleteConfirmMssg(),
        type: "warning",   
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Eliminar",
        cancelButtonText: "Cancelar",    
        showCancelButton: true,
        showLoaderOnConfirm: true,
        closeOnConfirm: false 
    },
    function(){   
        deleteCaller(id, controller);
    });
}


// Confirmation message
function confirmDeleteProgs(id, controller)
{
    swal({   
        title: "¿Está seguro?",   
        text: getDeleteConfirmMssgProgs(),
        type: "warning",   
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Eliminar",
        cancelButtonText: "Cancelar",    
        showCancelButton: true,
        showLoaderOnConfirm: true,
        closeOnConfirm: false 
    },
    function(){   
        deleteCaller(id, controller);
    });
}

// Confirmation message, redirecto to index
function confirmDeleteCustom(id, controller)
{
    swal({   
        title: "¿Está seguro?",   
        text: getDeleteConfirmMssg(),
        type: "warning",   
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Eliminar",
        cancelButtonText: "Cancelar",    
        showCancelButton: true,
        showLoaderOnConfirm: true,
        closeOnConfirm: false 
    },
    function(){   
        deleteCallerCustom(id, controller);
    });
}


// error for deletion
function errorDeletion(message)
{
    swal({   
        title: "Error",   
        text: message,
        type: "error",   
        allowEscapeKey: true,
    },
    function(){   
        /* nothing */
    });
}


// after deletion
function successDeletion()
{
    swal({   
        title: "Completado",   
        text: getDeleteSuccessMssg(),
        type: "success",   
        allowEscapeKey: false,
    },
    function(){   
        location.reload();
    });
}

// after deletion
function successDeletionCustom()
{
    swal({   
        title: "Completado",   
        text: getDeleteSuccessMssg(),
        type: "success",   
        allowEscapeKey: false,
    },
    function(){         
        window.location.href = "/" + getController();
    });
}


function getController()
{
    var data = $("#data-container");
    var control = $(data).data('controller');
    return control;
}

function getPrefix()
{
    var data = $("#data-container");
    var prefix = $(data).data('prefix');
    if (prefix != null)
        return prefix;
    else
        return "";
}

function getAction()
{
    var data = $("#data-container");
    var action = $(data).data('action');
    if (action != null)
        return action;
    else
        return "";
}

function getName()
{
    var data = $("#data-container");
    var name = $(data).data('name');
    return name;
}

function getExtra()
{
    var data = $("#data-container");
    var extra = $(data).data('extra');
    return extra;
}

function getExtraProgs()
{
    var data = $("#data-container");
    var extra = $(data).data('extraprogs');
    return extra;
}


function getDeleteConfirmMssg(n)
{
    var extra = getExtra();
    if(extra != "none")
    {        
        var replaced = extra.replace(/_/g, ' ');
        return replaced;
    }

    var n = getName();
    var male = getGender();

    var mssg = (male ? "El" : "La") + " ";
    mssg += n;
    mssg += " no podrá ser recuperad";
    mssg += (male ? "o" : "a");
    mssg += " posteriormente.";
    return mssg;
}


function getDeleteConfirmMssgProgs(n)
{
    var extra = getExtraProgs();
    if(extra != "none")
    {        
        var replaced = extra.replace(/_/g, ' ');
        return replaced;
    }

    var n = getName();
    var male = getGender();

    var mssg = (male ? "El" : "La") + " ";
    mssg += n;
    mssg += " no podrá ser recuperad";
    mssg += (male ? "o" : "a");
    mssg += " posteriormente.";
    return mssg;
}

function getDeleteSuccessMssg(n)
{
    var n = getName();
    var male = getGender();

    var mssg = (male ? "El" : "La") + " ";
    mssg += n;
    mssg += " ha sido eliminad";
    mssg += (male ? "o" : "a");
    mssg += " satisfactoriamente.";
    return mssg;
}

function getGender()
{
    var data = $("#data-container");
    var g = $(data).data('gender');

    if (g == "M")
        return true;
    else
        return false;
}

function getNewText()
{
    var gen = getGender();
    var mssg = (gen ? "Nuevo" : "Nueva") + " ";
    mssg += getName();
    return mssg;
}

function columnsCount(sel)
{
  var cols = $(sel).find("tr:first th");
  var count = 0;
  for(var i = 0; i < cols.length; i++)
  {
     var colspan = cols.eq(i).attr("colspan");
     if( colspan && colspan > 1)
     {
        count += colspan;
     }else{
        count++;
     }
  }
  return count;
}


$( document ).ready(function() {
    var cont = $("#new-obj-btn");
    var nn = getNewText();
    
    if(cont)
    {
        cont.attr('data-original-title', nn);
    }
});
