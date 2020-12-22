module TableButtonsHelper

	def show(id, blank)
		"<div class='tabledit-toolbar btn-toolbar'>
		  <div class='btn-group btn-group-sm'>
		    <button type='button' class='tabledit-view-button btn btn-sm btn-default' 
		      onclick='MvhmpjkgasdQgl($(this))' data-id='#{id}' data-blank='#{blank}' >
		      <i class='nav-icon i-Eye1 font-weight-bold'></i>
		    </button>
		  </div>
		</div>".html_safe
	 end

	def status_badge(is_active)
	 	if is_active
	 		return "<span class='badge badge-success'>Activo</span>".html_safe
	 	else
	 		return "<span class='badge badge-warning'>Inactivo</span>".html_safe
	 	end
	end

	def green_div
		"<span class='badge badge-success'>Sí</span>".html_safe
	end

	def red_div
		"<span class='badge badge-warning'>No</span>".html_safe
	end

	def show_edit_destroy(id, blank,verb)
		"<button type='button' class='tabledit-view-button btn btn-sm btn-default' 
	      onclick='MvhmpjkgasdQgl($(this))' data-id='#{id}' data-blank='#{blank}'>
	      <i class='nav-icon i-Eye1 font-weight-bold'></i>
	    </button>
	    <button type='button' class='tabledit-view-button btn btn-sm btn-default ml-2'
	      onclick='xxvkSdfDkbd($(this))' data-id='#{id}' data-verb='#{verb}'>
	      <i class='nav-icon i-Pen-2 font-weight-bold'></i>
	    </button>
	    <button type='button' class='tabledit-view-button btn btn-sm btn-default ml-2'
	       onclick='WxlBcodAzjsadW($(this), event)' data-id='#{id}'>
	      <i class='nav-icon i-Close-Window font-weight-bold'></i>
	    </button>".html_safe
	 end


	def show_edit_destroy_path_special_confirm(id,blank,path,confirm_route,edit_path)
		verb = "edit"

		"<div class='tabledit-toolbar btn-toolbar'>
		  <div class='btn-group btn-group-sm'>
		    <button type='button' class='tabledit-view-button btn btn-sm btn-default' 
		      onclick='MvhmpjkgasdQglPath($(this))' data-id='#{id}' data-blank='#{blank}' data-path= '#{path}'>
		      <span class='font-icon-eye'></span>
		    </button>
		    <button type='button' class='tabledit-edit-button btn btn-sm btn-default'
		      onclick='xxvkSdfDkbdPath($(this))' data-id='#{id}' data-verb='#{verb}' data-path= '#{edit_path}'>
		      <span class='font-icon-pencil'></span>
		    </button>
		    <button type='button' class='tabledit-delete-button btn btn-sm btn-default'
		       onclick='QefBcodAzjnlaW($(this), event)' data-id='#{id}' data-route='#{confirm_route}'>
		      <span class='font-icon-trash'></span>
		    </button>
		  </div>
		</div>".html_safe
	end

	def show_edit_destroy_path_color(id, blank,path,edit_path)
		"<div class='tabledit-toolbar btn-toolbar'>
		  <div class='btn-group btn-group-sm'>
		    <button type='button' class='tabledit-view-button btn btn-sm btn-default' 
		      onclick='MvhmpjkgasdQglPath($(this), event)' data-id='#{id}' data-blank='#{blank}' data-path='#{path}'>
		      <span class='font-icon-eye'></span>
		    </button>
		    <button type='button' class='tabledit-edit-button btn btn-sm btn-info'
		      onclick='MvhmpjkgasdQglPath($(this), event)' data-id='#{id}' data-blank='#{blank}' data-path='#{edit_path}'>
		      <span class='font-icon-user'></span>
		    </button>
		    <button type='button' class='tabledit-delete-button btn btn-sm btn-default'
		       onclick='WxlBcodAzjsadW($(this), event)' data-id='#{id}'>
		      <span class='font-icon-trash'></span>
		    </button>
		  </div>
		</div>".html_safe
	 end
end
