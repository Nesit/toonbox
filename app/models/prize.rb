class Prize < ActiveRecord::Base
  include TranslationStuff

  translates :title, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_attached_file :logo, styles: { thumb: '125x100>' },
                           path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                           url: "/system/:class/:attachment/:id/:style/:filename",
                           default_style: :thumb

  attr_accessible :title, :description, :logo

  validates :title, :description, :logo, presence: true
end
