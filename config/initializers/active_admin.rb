ActiveAdmin.setup do |config|
  config.site_title = "Toonbox"
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.batch_actions = true
  config.register_javascript '//api-maps.yandex.ru/2.0/?load=package.full&lang=ru-RU'
  config.before_filter :set_admin_locale
  config.register_javascript 'ckeditor/init.js'
end
