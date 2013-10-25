class AboutController < ApplicationController
  def index
    @description = VirtualPage.find_by_name("about").seo_tags
    @head_section = 'about_studio'
    @submenu_section = 'about '
  end
end