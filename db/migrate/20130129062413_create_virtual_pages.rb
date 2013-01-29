class CreateVirtualPages < ActiveRecord::Migration
  def up
    create_table :virtual_pages do |t|
      t.attachment :image
      t.string :name, null: false
      t.timestamps
    end
    VirtualPage.create_translation_table!({html_title: :text, html_keywords: :text,
                                           html_description: :text}, {migrate_data: true})
  end

  def down
    drop_table :virtual_pages
    VirtualPage.drop_translation_table! migrate_data: true
  end
end
