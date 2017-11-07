module ApplicationHelper
  def validation_js_classes field
    ['js_validate_me ', 'js_field_', field].join();
  end
end
