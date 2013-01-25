class CreatePartners < ActiveRecord::Migration
  def up
    create_table :partners do |t|
      t.attachment :logo
      t.timestamps
    end
    Partner.create_translation_table!({title: :string, description: :text}, {migrate_data: true})
  end

  def down
    drop_table :partners
    Partner.drop_translation_table! migrate_data: true
  end
end
