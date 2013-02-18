class MovieEpisode < ActiveRecord::Base
  include TranslationStuff

  acts_as_list

  translates :title, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  belongs_to :movie
  has_many :images, as: :relation, class_name: 'MovieImage', dependent: :destroy

  attr_accessible :title, :description, :video_url, :movie_id, :position

  validates :title, :description, presence: true

  def default_image(style=:thumb, digest=true)
    if images.present?
      images.defaults.first ? images.defaults.first.image.url(style, digest) : images.sample.image.url(style, digest)
    else
      '/assets/no_image.gif'
    end
  end

  class << self
    def clear_positions
      self.all.each_with_index {|m, index| m.update_attribute(:position, index + 1)}
    end
  end
end
