class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all
    @seo_tags = VirtualPage.find_by_name('feedbacks').seo_tags
    @head_section = 'about_studio'
    @submenu_section = 'feedbacks'
  end
end
