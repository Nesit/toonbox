class JobPositionRequest < ActiveRecord::Base
  belongs_to :job_positions

  has_attached_file :attachment, path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                                 url: "/system/:class/:attachment/:id/:style/:filename"

  attr_accessible :email, :attachment, :text

  # validated_attachment :attachment, :size => {:in => 0..10.megabytes}
end
