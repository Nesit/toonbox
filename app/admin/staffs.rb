# -*- coding: utf-8 -*-
ActiveAdmin.register Staff do
  menu label: 'Сотрудники', parent: 'Модули'
  actions :all, :except => [:show]
  config.clear_sidebar_sections!

  form partial: 'form'

  index do
    column :photo do |resource|
      link_to image_tag(resource.photo.url(:ico)), resource.photo.url(:original)
    end
    column :title
    column :job
    column :position
    default_actions
  end
end
