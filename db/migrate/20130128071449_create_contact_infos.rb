class CreateContactInfos < ActiveRecord::Migration
  def up
    create_table :contact_infos do |t|
      t.timestamps
      t.string :coords
      t.text :lj_url, :vk_url, :tw_url
    end
    ContactInfo.create_translation_table!({right_block: :text, left_block: :text}, {migrate_data: true})
  end

  def down
    drop_table :contact_infos
    ContactInfo.drop_translation_table! migrate_data: true
  end
end
