module ApplicationHelper
  #coccon
  def link_to_remove_association_confirmed(*args, &block)
      if block_given?
        link_to_remove_association(capture(&block), *args)
      elsif args.first.respond_to?(:object)
        form = args.first
        association = form.object.class.to_s.tableize
        name = I18n.translate("cocoon.#{association}.remove", default: I18n.translate('cocoon.defaults.remove'))

        link_to_remove_association(name, *args)
      else
        name, f, html_options = *args
        html_options ||= {}

        is_dynamic = f.object.new_record?

        classes = []
        classes << "remove_confirmed_fields"
        classes << (is_dynamic ? 'dynamic' : 'existing')
        classes << 'destroyed' if f.object.marked_for_destruction?
        html_options[:class] = [html_options[:class], classes.join(' ')].compact.join(' ')

        wrapper_class = html_options.delete(:wrapper_class)
        html_options[:'data-wrapper-class'] = wrapper_class if wrapper_class.present?

        hidden_field_tag("#{f.object_name}[_destroy]", f.object._destroy) + link_to(name, '#', html_options)
      end
    end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder, :ind => f.index.to_s)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def button_to_add_act_to_companies(name, f, association, selector)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder, :ind => f.index.to_s)
    end
    button_to_function(name, "add_act_to_companies(\"#{selector}\", \"#{association}\", \"#{escape_javascript(fields)}\", \"#{f.index.to_s}\")")
  end

end