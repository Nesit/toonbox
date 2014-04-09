class ViewsController < ApplicationController  
  def refresh
    p params[:episodes]
    episodes = params[:episodes]
    if episodes != nil 
      episodes.each do |ep_id|
        ep = MovieEpisode.find(ep_id)
        ep.update_youtube_view_count!
        ep.update_vimeo_view_count!
      end
    end
    # %x[rake movies:update_youtube_view_count]
    # %x[rake movies:update_vimeo_view_count]
    redirect_to "/admin/views"
  end

end