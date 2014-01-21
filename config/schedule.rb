every 1.day do
  rake 'movies:update_youtube_view_count'
  rake 'movies:update_vimeo_view_count'
end