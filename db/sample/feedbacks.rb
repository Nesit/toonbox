FileUtils.rm_rf Rails.root.join('public/system/feedback')

@images = Dir.glob(Rails.root.join('db/sample/files/partner/logos', '*'))

def sample_image
  File.new @images.sample
end

Feedback.all.each do |feedback|
  feedback.update_attribute(:logo, sample_image)
end
