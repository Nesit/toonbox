FileUtils.rm_rf Rails.root.join('public/system/partner')

@images = Dir.glob(Rails.root.join('db/sample/files/partner/logos', '*'))

def sample_image
  File.new @images.sample
end

Partner.all.each do |partner|
  partner.update_attribute(:logo, sample_image)
end
