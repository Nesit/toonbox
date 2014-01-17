namespace :movies do
  desc 'Update youtube view count for movies episodes'
  task :update_youtube_view_count => :environment do
    MovieEpisode.all.each do |ep|
      ep.update_youtube_view_count!
    end
  end
end