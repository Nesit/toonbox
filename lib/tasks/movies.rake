namespace :movies do
  desc 'Update youtube view count for movies episodes'
  task :update_youtube_view_count => :environment do
    errors = []
    episodes = []
    MovieEpisode.all.each do |ep|
      begin
        ep.update_youtube_view_count!
      rescue Exception => e
        puts e.message
        episodes << ep
        errors << e.message
      end
      sleep 1
    end
    if episodes.present?
      print 'sending youtube report... '
      VideosMailer.youtube_errors_notify(episodes, errors).deliver
      puts "[ok] "
    end
  end

  desc 'Update vimeo view count for movies episodes'
  task :update_vimeo_view_count => :environment do
    errors = []
    episodes = []
    MovieEpisode.all.each do |ep|
      begin
        ep.update_vimeo_view_count!
      rescue Exception => e
        puts e.message
        episodes << ep
        errors << e.message
      end
      sleep 1
    end
    if episodes.present?
      print 'sending vimeo report... '
      VideosMailer.vimeo_errors_notify(episodes, errors).deliver
      puts "[ok] "
    end
  end
end