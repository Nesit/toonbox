# -*- coding: utf-8 -*-
ActiveAdmin.register Movie do
  menu label: 'Фильмы', parent: 'Модули'
  actions :all, :except => [:show]

  config.sort_order = 'position_asc'
  config.paginate   = false
  sortable

  filter :new_movie, as: :select, collection: [['Да', true],['Нет', false]], include_blank: true
  filter :awarded, as: :select, collection: [['Да', true],['Нет', false]], include_blank: true

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
      render 'admin/shared/movie_images/add_image', layout: false
    end

    def image_as_default
      MovieImage.find(params[:image_id]).default!
      head :ok
    end

  end

  index do
    sortable_handle_column
    column "Изображение" do |resource|
      link_to image_tag(resource.default_image), ''
    end
    column :title
    column :position
    column :new_movie do |resource|
      resource.new_movie? ? 'Да' : 'Нет'
    end
    column :awarded do |resource|
      resource.awarded? ? 'Да' : 'Нет'
    end
    default_actions
  end

end
