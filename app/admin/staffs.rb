# -*- coding: utf-8 -*-
ActiveAdmin.register Staff do
  menu label: 'Сотрудники', parent: 'Модули'
  # actions :all, :except => [:show]
  config.clear_sidebar_sections!

  config.sort_order = 'position_asc'
  config.paginate   = false
  sortable

  form partial: 'form'

  index do
    sortable_handle_column
    column :photo do |resource|
      link_to image_tag(resource.photo.url(:ico)), resource.photo.url(:original)
    end
    column :title
    column :job
    default_actions
  end
end
