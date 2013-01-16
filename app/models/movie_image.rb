class MovieImage < ActiveRecord::Base
  belongs_to :movie

  has_attached_file :image, styles: { thumb: "266x143>" },
                    path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                    url: "/system/:class/:attachment/:id/:style/:filename",
                    default_style: :thumb,
                    default_url: '/assets/no_image.gif'

  attr_accessible :movie_id, :movie, :default

  scope :defaults, where(default: true)
end
