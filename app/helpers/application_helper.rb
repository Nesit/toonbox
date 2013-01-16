module ApplicationHelper
  def body_name
    [controller.action_name, controller.controller_name].join(' ')
  end

  def language?(language)
    'active' if I18n.locale == language
  end

  def host_path
    "#{request.protocol}#{request.host_with_port}"
  end

  def full_url
    "#{host_path}#{request.fullpath}"
  end

end
