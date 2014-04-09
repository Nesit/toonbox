class CreateAdminRole < ActiveRecord::Migration
  def up
    AdminUser.create!(:email => 'admin@example.com',
                      :password => 'password',
                      :password_confirmation => 'password',
                      :receive_resume => true)
  end

  def down
  end
end
