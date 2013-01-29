class NewsController < ApplicationController
  def index
    @latest_news = Novelty.for_index_page
    @news = Novelty.published_except(@latest_news).order('created_at DESC')
    @seo_tags = VirtualPage.find_by_name('news').seo_tags
    @head_section = 'news'
  end

  def show
    @novelty = Novelty.find(params[:id])
    @seo_tags = { title: @novelty.title, description: @novelty.description, image: @novelty.image.url }
    @head_section = 'news'
  end
end
