class PrizesController < ApplicationController
  def index
    @prizes = Prize.all
    @seo_tags = VirtualPage.find_by_name('partners').seo_tags
  end
end
