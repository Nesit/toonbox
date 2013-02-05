class AddUrlToPartners < ActiveRecord::Migration
  def up
    add_column :partners, :url, :text
  end

  def down
    remove_column :partners, :url
  end
end
