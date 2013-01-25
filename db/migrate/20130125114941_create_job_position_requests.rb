class CreateJobPositionRequests < ActiveRecord::Migration
  def change
    create_table :job_position_requests do |t|
      t.integer :job_position_id
      t.string :email, :state
      t.attachment :attachment
      t.text :text
      t.timestamps
    end
  end
end
