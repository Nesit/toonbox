FileUtils.rm_rf Rails.root.join('public/system/job_position_request')

@images = Dir.glob(Rails.root.join('db/sample/files/job_position_request/attachments', '*'))

def sample_image
  File.new @images.sample
end

ids = JobPositionRequest.all.map {|j| j.id}.sample(rand((JobPositionRequest.count / 2)..JobPositionRequest.count))

JobPositionRequest.find(ids) do |job_position_request|
  job_position_request.update_attribute(:attachment, sample_image)
end
