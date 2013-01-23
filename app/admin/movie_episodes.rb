ActiveAdmin.register MovieEpisode do
  form partial: 'form'

  controller do
    def destroy_image
      MovieImage.find(params[:id]).destroy
      render text: 'ok'
    end

    def add_image
      movie_episode = MovieEpisode.find(params[:id])
      @images = []
      params[:images].each do |image|
        @images << movie_episode.images.create(image: image)
      end
      render 'admin/shared/movie_images/add_image', layout: false
    end

    def image_as_default
      MovieImage.find(params[:image_id]).default!
      head :ok
    end

  end
end
