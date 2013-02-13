class AddFbUrlToStaffs < ActiveRecord::Migration
  def up
    add_column :staffs, :fb_url, :text
  end

  def down
    remove_column :staffs, :fb_url
  end
end
