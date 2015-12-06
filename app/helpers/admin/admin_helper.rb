module Admin::AdminHelper
  def navbar_item(name, path)
    content_tag(:li, link_to(name, path, class: "nav-link"), class: ("nav-item #{"active" if path == request.path}" ))
  end

  def validation_errors(instance, instance_name, instance_action)
    if instance.errors.any?
      content_tag(:div, id: "error_explanation") do
        content_tag(:div, class: "alert alert-danger") do
          content_tag(:h4, "#{pluralize(instance.errors.count, "error")} prohibited this #{instance_name} from being #{instance_action}:", class: "block") +
              content_tag(:ul) do
                instance.errors.full_messages.each do |msg|
                  concat(content_tag(:li, msg))
                end
              end
        end
      end
    end
  end
end
