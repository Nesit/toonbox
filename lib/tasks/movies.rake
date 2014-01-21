namespace :movies do
  desc 'Update youtube view count for movies episodes'
  task :update_youtube_view_count => :environment do
    MovieEpisode.all.each do |ep|
      begin
        ep.update_youtube_view_count!
      rescue Exception => e
        puts e.message
        puts e.backtrace
      end
    end
  end

  desc 'Update vimeo view count for movies episodes'
  task :update_vimeo_view_count => :environment do
    MovieEpisode.all.each do |ep|
      begin
        ep.update_vimeo_view_count!
      rescue Exception => e
        puts e.message
        puts e.backtrace
      end
    end
  end
end