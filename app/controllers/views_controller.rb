class ViewsController < ApplicationController  
  def refresh
    MovieEpisode.all.each do |ep|
      ep.update_youtube_view_count!
      ep.update_vimeo_view_count!
    end
    # %x[rake movies:update_youtube_view_count]
    # %x[rake movies:update_vimeo_view_count]
    redirect_to "/admin/views"
  end

end