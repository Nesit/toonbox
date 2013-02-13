set :stage, 'production'

role :web, "toonboox.bender.srv.balticit.ru"
role :app, "toonboox.bender.srv.balticit.ru"
role :db,  "toonboox.bender.srv.balticit.ru", :primary => true

set :user, "toonbox_production"
set :deploy_to, "/var/www/toonbox_production"

set :rails_env, "production"
set :branch, "master"
set :unicorn_env, 'production'
set :keep_releases, 5
set :app_env, 'production'

set :rake, "#{File.join shared_path, 'scripts/rvm_wrapper.sh'} bundle exec rake"

before 'unicorn:restart', 'deploy:symlink_robots'
