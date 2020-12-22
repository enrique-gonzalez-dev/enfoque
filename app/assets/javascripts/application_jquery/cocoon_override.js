(function($) {


  $(document).on('click', '.remove_confirmed_fields.dynamic, .remove_confirmed_fields.existing', function(e) {

    var $this = $(this),
        wrapper_class = $this.data('wrapper-class') || 'nested-fields',
        node_to_delete = $this.closest('.' + wrapper_class),
        trigger_node = node_to_delete.parent();
        mtitle = $this.data('title');
        mssg = $this.data('mssg');
        mpost = $this.data('post');

      e.preventDefault();

      trigger_node.trigger('cocoon:before-remove', [node_to_delete]);

      if ($this.hasClass('dynamic'))
      {
        node_to_delete.remove();
        return;
      }


    swal({   
        title: mtitle,   
        text: mssg,
        type: "warning",   
        confirmButtonColor: "#DD6B55",   
        confirmButtonText: "Eliminar",
        cancelButtonText: "Cancelar",    
        showCancelButton: true,
        closeOnConfirm: false,
        closeOnCancel: true,
        allowEscapeKey: false
    },
        function(isConfirm)
        {
          if(isConfirm)
          {        
            if ($this.hasClass('dynamic'))
            {
              node_to_delete.remove();
            }
            else
            {
              $this.prev("input[type=hidden]").val("1");
              node_to_delete.hide();
            }
            trigger_node.trigger('cocoon:after-remove', [node_to_delete]);

            swal({   
              title: "Completado",   
              text: mpost,
              type: "warning",   
              allowEscapeKey: true
            });
          }
    });
  });


  $('.remove_confirmed_fields.existing.destroyed').each(function(i, obj) {
    var $this = $(this),
        wrapper_class = $this.data('wrapper-class') || 'nested-fields';

    $this.closest('.' + wrapper_class).hide();
  });

})(jQuery);