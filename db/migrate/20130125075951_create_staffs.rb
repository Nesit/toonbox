class CreateStaffs < ActiveRecord::Migration
  def up
    create_table :staffs do |t|
      t.text :lj_url, :vk_url, :tw_url
      t.integer :position, default: 100, null: false
      t.attachment :photo
      t.timestamps
    end
    Staff.create_translation_table!({title: :string, job: :string, biography: :text}, { migrate_data: true })
  end

  def down
    drop_table :staffs
    Staff.drop_translation_table! migrate_data: true
  end
end
