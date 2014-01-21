class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @seo_tags = { title: @movie.title, description: @movie.description, image: @movie.default_image }
    @head_section = 'portfolio'
    @youtube_view_count = @movie.episodes.sum(:youtube_view_count)
    @vimeo_view_count = @movie.episodes.sum(:vimeo_view_count)
  end
end
