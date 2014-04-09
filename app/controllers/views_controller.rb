class ViewsController < ApplicationController  
  def refresh
    p "alo"
    p params[:episodes]
    redirect_to "/admin/views"
  end

end