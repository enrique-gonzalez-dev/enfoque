 function secsToHMS(time)
 {
 	var hours = Math.floor(time / 3600);
 	time -= hours * 3600;

 	var minutes = Math.floor(time / 60);
 	time -= minutes * 60;

 	var seconds = parseInt(time % 60, 10);

 	return (hours < 10 ? '0' + hours : hours ) + ':' + (minutes < 10 ? '0' + minutes : minutes) + ':' +
 	(seconds < 10 ? '0' + seconds : seconds);
 }

 function secsToHM(time)
 {
 	var hours = Math.floor(time / 3600);
 	time -= hours * 3600;

 	var minutes = Math.floor(time / 60);
 	time -= minutes * 60;

 	var seconds = parseInt(time % 60, 10);

 	return (hours < 10 ? '0' + hours : hours ) + ':' + (minutes < 10 ? '0' + minutes : minutes) ;
 }


 function secsToFormat(time)
 {
 	if(time <= 0)
 	{
 		return "0 minutos";
 	}

 	if(time < 60)
 	{
 		return "menos de un minuto";
 	}

 	var hours = Math.floor(time / 3600);
 	time -= hours * 3600;

 	var minutes = Math.floor(time / 60);
 	time -= minutes * 60;

 //	var seconds = parseInt(time % 60, 10);

 	var mins = (minutes == 1 ? minutes + " minuto" : minutes + " minutos");
 	if(hours > 0)
 	{
 		var hrs = (hours == 1 ? hours + " hora" : hours + " horas");
        if( minutes > 0)
            return hrs + ", " + mins;
        else
            return hrs;
 	}
 	else
 	{
 		return mins;
 	}
 }

 function dateToFormat(date)
 {
    var sd;

    if(date == null)
        sd = new Date();
    else
        sd = new Date(date);
        
    var mm = sd.getMonth();
    var dd = sd.getDate();
    var yy = sd.getFullYear();

    var month_names = ['Ene', 'Feb', 'Mar', 'Abr', 'Mayo', 'Junio', 'Julio', 'Aug', 'Sep', 'Oct', 'Nov', 'Dic'];
    return month_names[mm].toString() + " " +  dd.toString() + ", " + yy.toString();
 }

 function dateToTimeFormat(date)
 {
     var sd;    
    if(date == null)
        sd = new Date();
    else
        sd = new Date(date);
        
    var mm = sd.getMonth() +1;
    var dd = sd.getDate();
    var yy = sd.getFullYear();

    var hh = sd.getHours();
    var min = sd.getMinutes();

    var str = doubleDigit(dd) + "/" + doubleDigit(mm) + "/" + yy.toString() + " " + doubleDigit(hh) + ":" + doubleDigit(min);
    return str;
   // return sd.toLocaleString();
 }

 function doubleDigit(i)
 {
    if (i >= 10)
        return i.toString();
    else
        return "0" + i.toString();
 }

 function getProperty( propertyName, object )
 {
 	var parts = propertyName.split( "." ),
 	length = parts.length,
 	i,
 	property = object || this;

 	for ( i = 0; i < length; i++ ) {
 		property = property[parts[i]];
 	}

 	return property;
 }


 function setDataToForm(form_selector, prefix, name, obj, path )
 {
 	//console.log(obj);

 	$(form_selector)[0].reset();

 	$(form_selector).attr('action', path);

 	$(form_selector).find(".auto-prop").each(function(){
    
 		var id = $(this).attr('id');        
        if(id == null)
            return true;

        var key = id.replace(prefix, name);
        var val = getProperty(key, obj);
        var type = $(this).prop('type');


 		if(type == "text")
 		{
 			$(this).val(val);
 		}

 		if(type == "select-one")
 		{   
            if (val == "" || val == null)
            {
                var nid = id + " " + 'option';                
                $("#" + nid).prop("selected", false).trigger('change');
            }
            else
            {
     			var nid = id + " " + 'option[value="'+ val +'"]';
     			$("#" + nid).prop('selected', true);                            
            }        

            if($(this).hasClass("selectpicker"))
                $(this).selectpicker('refresh');
        }

 		return true;
  });
 }


 function setDataToElementProps(parent, obj)
 {
    //console.log(obj);
 	parent.find(".auto-prop").each(function(){
 		var key = $(this).data("prop");
        if(key == null)
            return true;
        
 		var val = getProperty(key, obj);

    // extra properties
    var minVal = $(this).data("min");
    var formatVal = $(this).data("format");
    var ignoreNull = $(this).data("ignoreNull");
    var showVal = $(this).data("show");
    var onlyShowVal = $(this).data("onlyShow");
    var notShowVal = $(this).data("notShow");
    var minShowVal = $(this).data("minShow");

    if(val != null && val != "undefined")
    {
    	var cont = val;

        if(notShowVal != null)
        {
            if(notShowVal == cont)
                $(this).hide();   
            else
                $(this).show();

            return true;        
        }

        if(onlyShowVal != null)
        {
            if(onlyShowVal == cont)
                $(this).show();
            else
                $(this).hide();   

            return true;        
        }


    	if(showVal == "on_true")
    	{
    		if(cont == true)
    			$(this).show();
    		else
    			$(this).hide();   

    		return true; 		
    	}
        
        if(showVal == "on_false")
    	{
    		if(cont == false)
    			$(this).show();
    		else
    			$(this).hide();   

    		return true; 		
    	}

        if(minShowVal != null)
        {
            var minShow = parseInt(minShowVal);
            cont = parseInt(cont);
            if(cont < minShow)
                $(this).hide();   
            else
                $(this).show();

            return true;        
        }

    	if(minVal != null)
    	{
    		var min = parseInt(minVal);
    		cont = parseInt(val);
    		if(cont < min)
    			cont = min;
    	}

        if (startsWith(formatVal, "data:"))
        {
            var ns = formatVal.substring(5);
            $(this).attr("data-" + ns, cont);

            return true;
        }

    	if(formatVal == "HM")
    	{
    		cont = secsToFormat( parseInt(cont) );
    	}  

    	if(formatVal == "YN")
    	{
    		if(cont == true || cont == 'Y' || cont == 1)
    			cont = "Sí";
    		else
    			cont = "No";
    	}

        if(formatVal == "DT" || formatVal == "DTNTS")
        {
            cont = dateToTimeFormat(cont);
        }
        

        if(formatVal == "money")
        {
            cont = moneyToFormat(cont);   
        }

        if(formatVal == "NTS" && cont == "")
        {
            $(this).text(" -- ");   
            return true;
        }      	

    	$(this).text(cont);
    }

    else if(formatVal == "NTS" || formatVal == "DTNTS")
    {
        $(this).text(" -- ");   
    } 

    else if(ignoreNull == null && ignoreNull != "true")
    {
    	$(this).text('');
    }

  });
 }

 function setDataToProps(parent_sel, obj)
 {
    var $p = $(parent_sel);
    setDataToElementProps($p, obj);
 }

 function focusFirstInput(form_selector)
 {
    var form  = $(form_selector);
    var firstInput = $(":input:visible:first", form);
    firstInput.focus();
 }

 function startsWith(str, word)
 {
    if (str != null && word != null)
        return str.lastIndexOf(word, 0) === 0;
    else
        return false;
 }


 function moneyToFormat(cents)
 {
    var mon = (parseInt(cents) / 100).toFixed(2);
    var str = mon.toString();
    var c = str.length;
    var dec = str.substring(c - 2);
    var inte = str.substring(0, c -2);
    var inteStr = inte.toString().split( /(?=(?:\d{3})+(?:\.|$))/g ).join( "," );
    return "$" + inteStr  + dec;

    /*
    var mon = (parseInt(cents) / 100).toFixed(2);
    return "$" + mon.toString();
    */
 }


function findObjInArrayById(array, id)
{
  var res = $.grep(array, function(e){ return e.id === id; });
  if(res.length >= 1)
    return res[0];
  else
    return null;    
}


/* ==========================
 * INVOICES 
 * ========================== */

 function openInvoice(url)
 {  
  newwindow2 = window.open(url,url,'addressbar=0,directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=0,height=700,width=800');
}


/* ==========================
 * DIALOGS 
 * ========================== */

function onWarningConfirmation(m_title, m_text, m_confirm, callback)
{
   swal({   
    title: m_title,   
    text: m_text,
    type: "warning",   
    confirmButtonColor: "#6d5cae",   
    confirmButtonText: m_confirm,
    cancelButtonText: "Cancelar",
    showCancelButton: true,
    closeOnConfirm: true,
    closeOnCancel: true,
    allowEscapeKey: true
},
  function(isConfirm)
  {
    if(isConfirm)
    {        
      callback();
    }
  });
}