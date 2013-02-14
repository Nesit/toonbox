class PersonsController < ApplicationController
  def index
    @staff = params[:id] ? Staff.find(params[:id]) : Staff.first
    @seo_tags = VirtualPage.find_by_name('persons').seo_tags
    @head_section = 'about_studio'
    @submenu_section = 'persons'
  end
end
