class MovieEpisode < ActiveRecord::Base
  include TranslationStuff

  translates :title, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations

  belongs_to :movie
  has_many :images, as: :relation, class_name: 'MovieImage', dependent: :destroy

  attr_accessible :title, :description, :video_url, :video_code, :movie_id,
                  :position, :official_url, :add_video_url

  validates :title, :description, presence: true

  def default_image(style=:thumb, digest=true)
    if images.present?
      images.defaults.first ? images.defaults.first.image.url(style, digest) : images.sample.image.url(style, digest)
    else
      nil
    end
  end

  def first_lightbox
    if images.defaults.present? && images.count > 1
      images.not(images.defaults.first).first
    elsif images.present?
      images.first
    else
      nil
    end
  end


  def update_youtube_view_count!
    urls = video_url.split(/, /)
    sum = 0
    urls.each do |v_url|
      return if v_url.blank? || v_url !~ /youtube/
      video_id = v_url.match(/v=([^&]+)/)[1]
      return if video_id.blank?
      require 'open-uri'
      url = "https://gdata.youtube.com/feeds/api/videos/#{video_id}?v=2&alt=json"
      print "[ep: #{id}, movie: #{movie_id}] #{url} ... "
      info = JSON.parse(open(url).read)
      sum += info['entry']['yt$statistics']['viewCount'].to_i
    end
      self.youtube_view_count = sum
      save!
      puts "[ok]"
  end

  def update_vimeo_view_count!
    return if video_url.blank? || video_url !~ /vimeo/
    video_id = video_url.match(/vimeo.com\/([0-9]+)/)[1]
    return if video_id.blank?
    require 'open-uri'
    url = "http://vimeo.com/api/v2/video/#{video_id}.json"
    print "[ep: #{id}, movie: #{movie_id}] #{url} ... "
    info = JSON.parse(open(url).read)
    self.vimeo_view_count = info[0]['stats_number_of_plays'].to_i
    save!
    puts "[ok]"
  end
end
