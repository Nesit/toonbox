class MovieImage < ActiveRecord::Base
  belongs_to :relation, polymorphic: true

  has_attached_file :image, styles: { thumb: "272x147^#", lightbox: '1280x720>' },
                    path: ":rails_root/public/system/:class/:attachment/:id/:style/:filename",
                    url: "/system/:class/:attachment/:id/:style/:filename",
                    default_style: :thumb,
                    default_url: '/assets/no_image.gif'

  attr_accessible :relation_id, :relation, :default, :image

  scope :defaults, -> { where(default: true) }
  scope :not, lambda {|images|
    images.class == Array ? where('id not in (?)', images.map {|i| i.id}) : where('id != ?', images.id)
  }

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
