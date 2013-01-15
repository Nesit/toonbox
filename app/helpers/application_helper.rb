module ApplicationHelper
  def body_name
    [controller.action_name, controller.controller_name].join(' ')
  end

  def language?(language)
    'active' if I18n.locale == language
  end
end
