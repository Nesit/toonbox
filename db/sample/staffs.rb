FileUtils.rm_rf Rails.root.join('public/system/staff')

@images = Dir.glob(Rails.root.join('db/sample/files/staff/photos', '*'))

def sample_image
  File.new @images.sample
end

Staff.all.each do |staff|
  staff.update_attribute(:photo, sample_image)
end
