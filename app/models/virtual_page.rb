class VirtualPage < ActiveRecord::Base
  include TranslationStuff

  translates :html_title, :html_keywords, :html_description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_attached_file :image, styles: { thumb: '403x403>' },
                            path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                            url: "/system/:class/:attachment/:id/:style/:filename",
                            default_style: :thumb

  attr_accessible :name, :html_title, :html_keywords, :html_description, :image

  validates :name, :html_title, :html_keywords, :html_description, presence: true
  validates :name, uniqueness: true

  def seo_tags
    { title: html_title,
      description: html_description,
      keywords: html_keywords,
      image: image.url }
  end
end
