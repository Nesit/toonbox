# -*- coding: utf-8 -*-
ActiveAdmin.register View do
  menu label: 'Обновить кол-во просмотров'
  actions :index
  config.batch_actions = false

  index do 
    render partial: 'form'
  end
end
