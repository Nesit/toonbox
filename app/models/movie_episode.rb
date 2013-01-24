class MovieEpisode < ActiveRecord::Base
  include TranslationStuff

  translates :title, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  belongs_to :movie
  has_many :images, as: :relation, class_name: 'MovieImage', dependent: :destroy

  attr_accessible :title, :description, :video_url, :movie_id

  validates :title, :description, presence: true

  def default_image
    if images.present?
      images.defaults.first ? images.defaults.first.image.url : images.sample.image.url
    else
      '/assets/no_image.gif'
    end
  end
end
