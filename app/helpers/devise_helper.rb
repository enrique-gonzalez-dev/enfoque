module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.first
    html = <<-HTML
      <div style="display:none" class="flash-tag" data-type="error"> #{messages}</div>
    HTML

    html.html_safe
  end
end