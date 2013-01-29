FileUtils.rm_rf Rails.root.join('public/system/virtual_page')

@images = Dir.glob(Rails.root.join('db/sample/files/movie_image/images', '*'))

def sample_image
  File.new @images.sample
end

VirtualPage.all.each do |virtual_page|
  ADDITIONAL_LOCALES.keys.each do |locale|
    virtual_page.translations.create(html_title: Faker::Lorem.words.join(' '),
                                     html_description: Faker::Lorem.words(12).join(' '),
                                     html_keywords: Faker::Lorem.words(12).join(' '),
                                     locale: locale.to_s)
  end

  virtual_page.update_attribute(:image, sample_image)
end
