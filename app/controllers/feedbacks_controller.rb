class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all
    @seo_tags = VirtualPage.find_by_name('feedbacks').seo_tags
  end
end
