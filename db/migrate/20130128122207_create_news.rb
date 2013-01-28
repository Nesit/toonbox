class CreateNews < ActiveRecord::Migration
  def up
    create_table :news do |t|
      t.timestamps
      t.attachment :image
      t.boolean :published, null: false, default: true
    end
    Novelty.create_translation_table!({title: :string, description: :text, text: :text},
                                      {migrate_data: true})
  end

  def down
    drop_table :news
    Novelty.drop_translation_table! migrate_data: true
  end
end
