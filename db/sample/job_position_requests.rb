FileUtils.rm_rf Rails.root.join('public/system/job_position_request')

@images = Dir.glob(Rails.root.join('db/sample/files/job_position_request/attachments', '*'))

def sample_image
  File.new @images.sample
end

JobPositionRequest.all.each do |job_position_request|
  job_position_request.update_attribute(:attachment, sample_image)
end
