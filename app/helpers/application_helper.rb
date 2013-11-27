module ApplicationHelper
   def my_devise_error_messages!
    if resource.errors.empty? 
      begin
        if resource.rolable.errors.empty?
          return ""
        end
      rescue
        return ""
      end
    end
    messages_count = 0
    messages = rolable_messages = ""

    if !resource.errors.empty?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      messages_count += resource.errors.count
    end

    begin
      if !resource.rolable.errors.empty?
        rolable_messages = resource.rolable.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
        messages_count += resource.rolable.errors.count
      end
    rescue
    end

    messages = messages + rolable_messages   
    sentence = I18n.t("errors.messages.not_saved",
                      :count => messages_count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
    <h2>#{sentence}</h2>
    <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
