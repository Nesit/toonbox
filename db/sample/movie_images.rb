FileUtils.rm_rf Rails.root.join('public/system/movie_image')

@images = Dir.glob(Rails.root.join('db/sample/files/movie_image/images', '*'))

def sample_image
  File.new @images.sample
end

MovieImage.all.each do |movie_image|
  movie_image.update_attribute(:image, sample_image)
end

Movie.all.each {|movie| movie.images.sample.update_attribute(:default, true) if movie.images.present? }
