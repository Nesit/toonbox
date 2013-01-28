FileUtils.rm_rf Rails.root.join('public/system/prize')

@images = Dir.glob(Rails.root.join('db/sample/files/prize/logos', '*'))

def sample_image
  File.new @images.sample
end

Prize.all.each do |prize|
  prize.update_attribute(:logo, sample_image)
end
