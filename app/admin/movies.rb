ActiveAdmin.register Movie do
  form partial: 'form'

  controller do
    def destroy_image
      MovieImage.find(params[:id]).destroy
      render text: 'ok'
    end

    def add_image
      movie = Movie.find(params[:id])
      @images = []
      params[:images].each do |image|
	@images << movie.images.create(image: image)
      end
      render :layout => false
    end

    def image_as_default
      MovieImage.find(params[:image_id]).default!
      head :ok
    end

  end

end
