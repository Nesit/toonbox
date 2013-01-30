class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = cookies['locale'] ? cookies['locale'].to_sym : I18n.default_locale
  end

  def set_admin_locale
    I18n.locale = :ru
  end
end
