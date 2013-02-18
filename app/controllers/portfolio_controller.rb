class PortfolioController < ApplicationController
  def index
    @movies = Movie.order('position ASC').with_image
    @seo_tags = VirtualPage.find_by_name('portfolio').seo_tags
    @head_section = 'portfolio'
  end
end
