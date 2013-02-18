class Movie < ActiveRecord::Base
  include TranslationStuff

  acts_as_list

  translates :title, :description, :awarded_text, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_many :images, as: :relation, class_name: 'MovieImage', dependent: :destroy
  has_many :episodes, class_name: 'MovieEpisode'

  attr_accessible :title, :description, :new_movie, :awarded, :awarded_text, :position

  validates :title, :description, presence: true

  def default_image
    (images.present? && images.defaults.first) ? images.defaults.first.image.url : '/assets/no_image.gif'
  end

  class << self
    def with_image
      self.all.map {|m| m if m.images.present?}.compact
    end

    def clear_positions
      self.all.each_with_index {|m, index| m.update_attribute(:position, index + 1)}
    end
  end
end
