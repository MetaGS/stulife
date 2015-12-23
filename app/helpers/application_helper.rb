module ApplicationHelper
  def full_title(page_title)
    home_title = "myStudent - Education Platform"
    base_title = "myStudent"

    if page_title.empty?
      home_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  def editable_section(section_id, classes = nil)
    javascript_include_tag 'tinymce'
    if current_admin
      content_tag :form do
        content_tag :div, id: section_id, class: classes.to_s + "editable" do
          PageRegion.find_by_country_id_and_name(@country.id, section_id).content.try(:html_safe)
        end
      end
    else
      content_tag :div, id: section_id, class: classes do
        PageRegion.find_by_country_id_and_name(@country.id, section_id).content.try(:html_safe)
      end
    end
  end
end
