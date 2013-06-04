class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :default_url_options
  
  helper_method :russia?

  def set_locale
    I18n.locale = cookies['locale'] ? cookies['locale'].to_sym : I18n.default_locale
  end

  def set_admin_locale
    I18n.locale = :ru
  end
  
  def russia?
    return true if Rails.env.development?
    GEO_IP.country(request.ip).country_name == 'Russian Federation'
  end

  protected

  def default_url_options
    ActionMailer::Base.default_url_options = {:host => request.host_with_port}
    ActionController::Base.default_url_options = {:host => request.host_with_port}
  end
end
