class PortfolioController < ApplicationController
  def index
    @movies = Movie.order('position ASC').with_image
    @seo_tags = VirtualPage.find_by_name('portfolio').seo_tags
    @head_section = 'portfolio'
    @youtube_view_count = MovieEpisode.sum(:youtube_view_count)
  end
end
