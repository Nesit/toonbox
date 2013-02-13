class AddFbUrlToContacts < ActiveRecord::Migration
  def up
    add_column :contact_infos, :fb_url, :text
  end

  def down
    remove_column :contact_infos, :fb_url
  end
end
