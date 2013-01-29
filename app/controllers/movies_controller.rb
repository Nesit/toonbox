class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @seo_tags = { title: @movie.title, description: @movie.description, image: @movie.default_image }
  end
end
