class CreateJobPositions < ActiveRecord::Migration
  def change
    create_table :job_positions do |t|
      t.boolean :open
      t.timestamps
    end
    Movie.create_translation_table! title: :string,
                                    short_description: :text,
                                    description: :text
  end
end
