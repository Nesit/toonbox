class AboutController < ActionController::Base
  layout 'application'

  def index
    @description = VirtualPage.find_by_name("about").seo_tags
    @staff = Staff.order('position ASC').first
  end
end