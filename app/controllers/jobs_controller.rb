class JobsController < ApplicationController
  def index
    @jobs = JobPosition.opens.order('created_at DESC')
  end

  def show
    @job = JobPosition.find(params[:id])
    @job_position_request = JobPositionRequest.new
  end

  def create_request
    job_request = JobPositionRequest.new(params[:job_position_request])
    if job_request.save
      flash[:notice] = "job position was saved"
      redirect_to root_path
    else
      render :show
    end
  end
end
