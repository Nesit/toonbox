class PersonsController < ApplicationController
  def index
    @staffs = Staff.all
    @seo_tags = VirtualPage.find_by_name('persons').seo_tags
  end
end
