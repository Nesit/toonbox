class MovieEpisode < ActiveRecord::Base
  translates :title, :description

  belongs_to :movie
  has_many :images, as: :relation, class_name: 'MovieImage', dependent: :destroy

  attr_accessible :title, :description

  validates :title, :description, presence: true
end
