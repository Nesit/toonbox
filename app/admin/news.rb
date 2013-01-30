# -*- coding: utf-8 -*-
ActiveAdmin.register Novelty do
  menu label: 'Новости'
  actions :all, :except => [:show]

  filter :published, as: :select, collection: [['Да', true],['Нет', false]], include_blank: true

  form partial: 'form'

  index do
    column :image do |resource|
      link_to image_tag(resource.image.url), resource.image.url(:original)
    end
    column :title
    column :published, sortable: 'published' do |resource|
      resource.published? ? 'Да' : 'Нет'
    end
    column :created_at
    default_actions
  end
end
