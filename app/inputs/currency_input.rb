class CurrencyInput < SimpleForm::Inputs::Base

  def input
    input_html_classes.unshift("string currency")
    input_html_options[:type] ||= input_type if html5?
   "<div class='input-group col-md-5'>" + 
    template.content_tag(:span, "$", class: "input-group-addon") +
      @builder.text_field(attribute_name, input_html_options) + 
    template.content_tag(:span, ".00", class: "input-group-addon") +
   "</div>"
  end
end