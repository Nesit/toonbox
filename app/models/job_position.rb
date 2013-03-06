class JobPosition < ActiveRecord::Base
  include TranslationStuff

  translates :title, :short_description, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_many :requests, class_name: 'JobPositionRequest'

  has_attached_file :test_job, path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                               url: "/system/:class/:attachment/:id/:style/:filename"

  scope :opens, where(open: true)

  attr_accessible :title, :short_description, :description, :open, :test_job

  validates :title, :short_description, :description, presence: true
end
