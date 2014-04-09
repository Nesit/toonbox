class ViewsController < ApplicationController  
  def refresh
    Rake::Task['movies:update_youtube_view_count'].invoke(args)
    Rake::Task['movies:update_vimeo_view_count'].invoke(args)
    redirect_to "/admin/views"
  end

end