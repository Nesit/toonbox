# -*- coding: utf-8 -*-
ActiveAdmin.register VirtualPage do
  menu label: 'Виртуальные страницы'
  actions :index, :edit, :update
  config.clear_sidebar_sections!

  form partial: 'form'

  index do
    id_column
    column :image do |resource|
      link_to(image_tag(resource.image.url(:ico)), resource.image.url(:original)) if resource.image.present?
    end
    column :name
    column :html_title
    default_actions
  end
end
