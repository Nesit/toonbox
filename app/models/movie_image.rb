class MovieImage < ActiveRecord::Base
  belongs_to :relation, polymorphic: true

  has_attached_file :image, styles: { thumb: "266x143>" },
                    path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                    url: "/system/:class/:attachment/:id/:style/:filename",
                    default_style: :thumb,
                    default_url: '/assets/no_image.gif'

  attr_accessible :relation_id, :relation, :default, :image

  scope :defaults, where(default: true)

  before_save :check_default

  def default!
    update_attribute(:default, true)
  end

  def not_default!
    update_attribute(:default, false)
  end

  protected

  def check_default
    if self.default_changed? && self.default == true
      self.relation.images.defaults.each {|s| s.not_default!}
    end
  end

end
