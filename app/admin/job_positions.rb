# -*- coding: utf-8 -*-
ActiveAdmin.register JobPosition do
  menu label: 'Вакансии'
  actions :all, :except => [:show]

  filter :open, as: :select, collection: [['Да', true],['Нет', false]], include_blank: true

  form partial: 'form'

  index do
    column :title
    column :open do |resource|
      resource.open? ? 'Да' : 'Нет'
    end
    column :requests do |resource|
      link_to resource.requests.count, admin_job_position_requests_path
    end
    default_actions
  end
end
