class CreatePrizes < ActiveRecord::Migration
  def up
    create_table :prizes do |t|
      t.attachment :logo
      t.timestamps
    end
    Prize.create_translation_table!({title: :string, description: :text}, {migrate_data: true})
  end

  def down
    drop_table :prizes
    Prize.drop_translation_table! migrate_data: true
  end
end
