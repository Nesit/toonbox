class Movie < ActiveRecord::Base
  include TranslationStuff

  translates :title, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_many :images, as: :relation, class_name: 'MovieImage', dependent: :destroy
  has_many :episodes, class_name: 'MovieEpisode'

  attr_accessible :title, :description

  validates :title, :description, presence: true

  def default_image
    (images.present? && images.defaults.first) ? images.defaults.first.image.url : '/assets/no_image.gif'
  end
end
