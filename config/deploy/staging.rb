set :stage, 'staging'

role :web, "stage.toonboox.bender.srv.balticit.ru"
role :app, "stage.toonboox.bender.srv.balticit.ru"
role :db,  "stage.toonboox.bender.srv.balticit.ru", :primary => true

set :user, "toonbox_staging"
set :deploy_to, "/var/www/toonbox_staging"

set :rails_env, "staging"
set :branch, "master"
set :unicorn_env, 'staging'
set :keep_releases, 5
set :app_env, 'staging'

set :rake, "#{File.join shared_path, 'scripts/rvm_wrapper.sh'} bundle exec rake"

before 'db:drop', 'unicorn:stop'
before 'db:create', 'db:drop'
after 'db:seed', 'db:load_sample'

before 'unicorn:restart', 'deploy:symlink_robots'
