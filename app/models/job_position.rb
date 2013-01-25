class JobPosition < ActiveRecord::Base
  include TranslationStuff

  translates :title, :short_description, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_many :requests, class_name: 'JobPositionRequest'

  scope :opens, where(open: true)
end
