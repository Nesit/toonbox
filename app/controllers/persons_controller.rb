class PersonsController < ApplicationController
  def index
    @staff = Staff.order('position ASC').first
    @seo_tags = VirtualPage.find_by_name('persons').seo_tags
    @head_section = 'about_studio'
    @submenu_section = 'persons'
  end

  def show
    @staff = Staff.find_by_slug(params[:id])
    @seo_tags = {title: @staff.title}
    render :index
  end
end
