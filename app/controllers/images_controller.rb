# encoding: utf-8
class ImagesController < ApplicationController
  def upload

    func_num = params['CKEditorFuncNum']

    if params[:upload].size > 2.megabytes
      message = "Размер файла слишком большой (> 2 Мб)"
    else
      uploader = ImageUploader.new
      begin
        uploader.store!(params[:upload])
        message = ""
        url = uploader.url
      rescue Exception => e
        message = "Не удалось загрузить изображение: #{e.message}"
      end
    end
    render text: "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(#{func_num}, '#{url}', '#{message}');</script>"
  end
end
