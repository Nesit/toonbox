# -*- coding: utf-8 -*-
ActiveAdmin.register MovieEpisode do
  menu label: 'Эпизоды'
  actions :all, :except => [:show]

  filter :movie

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

  index do
    column "Изображение" do |resource|
      link_to image_tag(resource.default_image), ''
    end
    column :title
    column :movie
    column :video_url do |resource|
      link_to(resource.video_url, resource.video_url, target: '_blank') if resource.video_url?
    end
    default_actions
  end
end
