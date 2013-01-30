# -*- coding: utf-8 -*-
ActiveAdmin.register ContactInfo do
  menu label: 'Контактная информация'
  actions :index, :edit, :update
  config.clear_sidebar_sections!

  form partial: 'form'

  index do
    id_column
    column :lj_url
    column :vk_url
    column :tw_url
    default_actions
  end

end
