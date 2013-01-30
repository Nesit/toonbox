class Feedback < ActiveRecord::Base
  include TranslationStuff

  translates :title, :text, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_attached_file :logo,  styles: { thumb: '125x100>' },
                            path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                            url: "/system/:class/:attachment/:id/:style/:filename",
                            default_style: :thumb
  attr_accessible :title, :text, :logo

  validates :title, :text, :logo, presence: true
end
