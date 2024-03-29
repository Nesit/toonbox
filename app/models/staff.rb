class Staff < ActiveRecord::Base
  include TranslationStuff
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_list

  translates :title, :job, :biography, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_attached_file :photo, styles: { thumb: '416x323^#', ico: '100x100>' },
                            path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                            url: "/system/:class/:attachment/:id/:style/:filename",
                            default_style: :thumb

  attr_accessible :title, :job, :biography, :lj_url, :vk_url, :tw_url, :fb_url, :position, :photo, :slug

  validates :title, :job, :biography, :photo, :position, presence: true
  validates :position, uniqueness: true

  class << self
    def clear_positions
      self.all.each_with_index {|m, index| m.update_attribute(:position, index + 1)}
    end
  end
end
