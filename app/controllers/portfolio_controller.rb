class PortfolioController < ApplicationController
  def index
    @movies = Movie.with_image
  end
end
