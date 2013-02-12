role :web, "stage.toonboox.bender.srv.balticit.ru"
role :app, "stage.toonboox.bender.srv.balticit.ru"
role :db,  "stage.toonboox.bender.srv.balticit.ru", :primary => true

set :stage, 'staging'
set :rails_env, 'staging'
set :app_env, 'staging' #this env is used by unicorns to start
set :unicorn_env, 'staging'
_cset :branch, 'master'

set :user, "toonbox_staging"
set :deploy_to,   "/var/www/toonbox_staging"
