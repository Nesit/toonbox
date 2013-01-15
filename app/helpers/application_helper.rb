module ApplicationHelper
  def body_name
    [controller.action_name, controller.controller_name].join(' ')
  end
end
