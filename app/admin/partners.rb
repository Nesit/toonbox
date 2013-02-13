# -*- coding: utf-8 -*-
ActiveAdmin.register Partner do
  menu label: 'Партнеры', parent: 'Модули'
  actions :all, :except => [:show]
  config.clear_sidebar_sections!

  form partial: 'form'

  index do
    column :logo do |resource|
      link_to image_tag(resource.logo.url), resource.logo.url(:original)
    end
    column :title
    default_actions
  end
end
