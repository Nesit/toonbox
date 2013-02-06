class PublicImage < ActiveRecord::Base
  has_attached_file :attachment, styles: { size1: "100x100", size2: '400x400'},
                                 path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                                 url: "/system/:class/:attachment/:id/:style/:filename"

  attr_accessible :attachment
end
