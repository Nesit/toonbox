class CreateJobPositions < ActiveRecord::Migration
  def up
    create_table :job_positions do |t|
      t.boolean :open, default: true, null: false
      t.timestamps
    end
    JobPosition.create_translation_table!({title: :string,
                                           short_description: :text,
                                           description: :text}, { migrate_data: true })
  end

  def down
    drop_table :job_positions
    JobPosition.drop_translation_table! migrate_data: true
  end
end
