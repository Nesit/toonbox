class Staff < ActiveRecord::Base
  include TranslationStuff

  translates :title, :job, :biography, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  has_attached_file :photo, styles: { thumb: '416x323>' },
                            path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                            url: "/system/:class/:attachment/:id/:style/:filename",
                            default_style: :thumb


  attr_accessible :title, :job, :biography, :lj_url, :vk_url, :tw_url, :position, :photo
end
