class JobsController < ApplicationController
  def index
    @jobs = JobPosition.opens.order('created_at DESC')
    @seo_tags = VirtualPage.find_by_name('jobs').seo_tags
    @head_section = 'about_studio'
    @submenu_section = 'job_positions'
  end

  def show
    @job = JobPosition.find(params[:id])
    @job_position_request = JobPositionRequest.new
    @head_section = 'about_studio'
    @submenu_section = 'jobs_positions'
  end

  def create_request
    @job = JobPosition.find(params[:id])
    @job_position_request = @job.requests.new(params[:job_position_request])
    if @job_position_request.save
      flash[:notice] = "job position was saved"
      redirect_to root_path
    else
      render :show
    end
  end
end
