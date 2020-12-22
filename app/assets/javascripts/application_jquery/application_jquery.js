function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")

  $(link).parent().before(content.replace(regexp, new_id));
}


/* = = = = = = =
    EXAMPLES 
  = = = = = = = */

/*
function add_restaurant_sub_categories(link, association, content, nid) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  var parent = $(link).closest(".subcategories-section");
  var section = parent.find(".subcategories-fields");
  var ncont = section.append(content.replace(regexp, new_id));
}


function add_input_to_garments(link, association, content, nid) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  var parent = $(link).closest(".inputs-section");
  var section = parent.find(".inputs-fields");
  var ncont = section.append(content.replace(regexp, new_id));
  
  var select = $("#garment_input_to_garments_attributes_"+new_id+"_laundry_input_id ");
  select.selectpicker();
  select.change(function() {
    var id =  parseInt($(this).val());
    var fi = findObjInArrayById(gon.laundry, id);
    //console.log(fi.unit_type);
    
    var cantidad = $("#garment_input_to_garments_attributes_"+new_id+"_quantity");
   // console.log(cantidad.val());
   var medida = cantidad.siblings(".input-group-addon");
   medida.text(fi.unit_type);
    //var pa = $(this).closest(".input-group");
    //var sp = pa.find(".input-group-addon");

    //var p =  $("#dish_input_to_dishes_attributes_"+new_id+"_food_input_id "+"-prev .input-group-addon").text('hola');
  });
  checkForEmptyLabel();
}
*/