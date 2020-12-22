
$(document).ready( function(){

	$('.inputs-fields').on('cocoon:after-remove', function(e, sec) {
		console.log("hi");
	    checkForEmptyLabel();
	});

	checkForEmptyLabel();
});

function checkForEmptyLabel()
{
  var nests = $(".inputs-fields").children(".nested-fields");
  var cc = 0;

  for (var i = 0; i < nests.length; i++)
  {
    if ($(nests[i]).is(":visible"))
    {      
    	cc += 1;  
    }
  };
  
  if(cc < 1)
    $("#empty_elements_notice").show("fast");
  else
    $("#empty_elements_notice").hide("fast");
} 
