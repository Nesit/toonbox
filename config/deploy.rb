set :stage_dir, "config/deploy/stages"
set :stages, Dir[ "#{ File.dirname(__FILE__) }/deploy/stages/*.rb" ].collect { |fn| File.basename(fn, ".rb") }

set :application, "toonbox"
set :repository,  "git@github.com:balticit/toonbox.git"

set :scm, :git
set :use_sudo, false
set :deploy_via, :remote_cache
set :default_stage, "staging"
set :keep_releases, 10

default_run_options[:shell] = 'bash -l'
# set :whenever_command, "bundle exec whenever"
# set :whenever_environment, defer { stage }
set :rake, 'bundle exec rake'

after 'deploy:update_code', 'deploy:symlink_shared'

namespace :deploy do
  task :default do
    transaction do
      update_code
      symlink
      db.migrate
      assets.precompile
      unicorn.stop
      unicorn.start
    end
    deploy.cleanup
  end

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      puts "CURRENT_REVISION: #{current_revision}"
      puts "SOURCE.NEXT_REVISION: #{source.next_revision(current_revision)}"
      from = source.next_revision(current_revision)
      puts "SOURCE LOCAL LOG: #{source.local.log(from)}"
      puts capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l")
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
	run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
	logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

end

namespace :db do
  task :migrate, :roles => :db do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec rake db:migrate --trace"
  end
end

require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano-unicorn'
