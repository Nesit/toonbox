class AddFbUrlToContacts < ActiveRecord::Migration
  def change
    add_column :contact_infos, :fb_url, :text
  end
end
