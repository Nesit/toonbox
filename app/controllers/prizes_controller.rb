class PrizesController < ApplicationController
  def index
    @prizes = Prize.all
    @seo_tags = VirtualPage.find_by_name('partners').seo_tags
    @head_section = 'about_studio'
    @submenu_section = 'prizes'
  end
end
