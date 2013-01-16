class Movie < ActiveRecord::Base
  translates :title, :description

  has_many :movie_images, dependent: :destroy

  attr_accessible :title, :description

  validates :title, :description, presence: true

  def default_image
    (movie_images.present? && movie_images.defaults.first) ? movie_images.defaults.first.image.url : '/assets/no_image.gif'
  end
end
