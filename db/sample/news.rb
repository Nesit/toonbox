FileUtils.rm_rf Rails.root.join('public/system/novelty')

@images = Dir.glob(Rails.root.join('db/sample/files/novelty/images', '*'))

def sample_image
  File.new @images.sample
end

Novelty.all.each do |novelty|
  novelty.update_attribute(:image, sample_image)
end
