class Novelty < ActiveRecord::Base
  include TranslationStuff

  translates :title, :description, :text, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_attached_file :image, styles: { thumb: '214x179>' },
                            path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                            url: "/system/:class/:attachment/:id/:style/:filename",
                            default_style: :thumb

  attr_accessible :title, :description, :text, :published, :image

  scope :published, where(published: true)
  scope :published_except, lambda{|news| where('id NOT IN (?)', news.map {|n| n.id})}

  class << self
    def for_index_page
      published.order('created_at DESC').first(3)
    end
  end
end
