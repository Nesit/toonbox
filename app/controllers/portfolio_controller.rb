class PortfolioController < ApplicationController
  def index
    @movies = Movie.all
  end
end
