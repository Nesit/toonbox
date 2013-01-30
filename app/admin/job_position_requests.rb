# -*- coding: utf-8 -*-
ActiveAdmin.register JobPositionRequest do
  menu false
  actions :all, :except => [:show,:new,:create]

  filter :job_position

  index do
    id_column
    column :email
    column :job_position
    column :attachment do |resource|
      link_to(resource.attachment_file_name,
              resource.attachment.url(:original,false),
              target: '_blank') if resource.attachment.present?
    end
    default_actions
  end

  form do |f|
    f.inputs "Основное" do
      f.input :job_position, input_html: { disabled: true }
      f.input :email, input_html: { disabled: true }
      f.input :text, input_html: { disabled: true }
    end
    f.inputs "Действия" do
      link_to "Удалить заявку", admin_job_position_request_path(resource), :method => :delete, :data => {:confirm => "Вы уверены?" }
    end
  end
end
