class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @seo_tags = { title: @movie.title, description: @movie.description, image: @movie.default_image }
    @head_section = 'portfolio'
  end
end
