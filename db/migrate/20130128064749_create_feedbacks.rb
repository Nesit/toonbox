class CreateFeedbacks < ActiveRecord::Migration
  def up
    create_table :feedbacks do |t|
      t.attachment :logo
      t.timestamps
    end
    Feedback.create_translation_table!({title: :string, text: :text}, {migrate_data: true})
  end

  def down
    drop_table :feedbacks
    Feedback.drop_translation_table! migrate_data: true
  end
end
