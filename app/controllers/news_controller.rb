class NewsController < ApplicationController
  def index
    @latest_news = Novelty.for_index_page
    @news = Novelty.published_except(@latest_news).order('created_at DESC')
  end

  def show
    @novelty = Novelty.find(params[:id])
  end
end
