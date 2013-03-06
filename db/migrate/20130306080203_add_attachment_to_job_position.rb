class AddAttachmentToJobPosition < ActiveRecord::Migration
  def self.up
    add_attachment :job_positions, :test_job
  end

  def self.down
    remove_attachment :job_positions, :test_job
  end
end
