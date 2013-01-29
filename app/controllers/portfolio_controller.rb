class PortfolioController < ApplicationController
  def index
    @movies = Movie.with_image
    @seo_tags = VirtualPage.find_by_name('portfolio').seo_tags
  end
end
