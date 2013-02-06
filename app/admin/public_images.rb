# -*- coding: utf-8 -*-
ActiveAdmin.register PublicImage do
  menu label: 'Изображения'
  actions :all, :except => [:edit, :update]
  config.clear_sidebar_sections!


  index do
    id_column
    column :attachment do |resource|
      link_to image_tag(resource.attachment.url(:size1)), resource.attachment.url(:original)
    end
    column :created_at
    default_actions
  end


  show do
    attributes_table :id, :attachment_file_name, :attachment_file_size, :created_at

    panel 'Изображение' do
      attributes_table_for resource do
        row('превью') { image_tag resource.attachment.url(:size2) }
        row('100x100') { link_to URI.join(host_path, resource.attachment.url(:size1, false)), resource.attachment.url(:size1, false) }
        row('400x400') { link_to URI.join(host_path, resource.attachment.url(:size2, false)), resource.attachment.url(:size2, false) }
        row('оригинал') { link_to URI.join(host_path, resource.attachment.url(:original, false)), resource.attachment.url(:original, false) }
      end
    end

  end

  form do |f|
    f.inputs do
      f.input :attachment, :as => :file, :hint => f.template.image_tag(f.object.attachment.url)
    end
    f.actions
  end

end
