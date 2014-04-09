# -*- coding: utf-8 -*-
ActiveAdmin.register AdminUser do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :receive_resume do |resource|
      resource.receive_resume? ? 'Да' : 'Нет'
    end
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :receive_resume, as: :select, collection: [['Да', true],['Нет', false]], include_blank: false
    end
    f.actions
  end
end