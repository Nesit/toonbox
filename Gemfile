source :rubygems

gem 'rails', '3.2.11'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'globalize3'
gem 'paperclip'
gem 'activeadmin'
gem 'russian'
gem 'devise-russian'
gem 'active_admin_editor', github: 'ejholmes/active_admin_editor', ref: 'ed3bf0e769'

group :production do
  gem 'pg'
  gem 'unicorn'
end

group :development, :test, :staging do
  gem 'ffaker'
end

group :development do
  gem 'debugger'
  gem 'sqlite3'
  gem 'thin'
  gem 'sextant'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

