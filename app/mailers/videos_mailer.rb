# encoding: utf-8

class VideosMailer < ActionMailer::Base
  default from: "info@#{ActionMailer::Base.default_url_options[:host]}"

  def youtube_errors_notify(episodes, errors)
    @episodes = episodes
    @errors = errors
    AdminUser.all.each do |admin|
      mail(subject: "Ошибки видео c youtube", to: admin.email)
    end
  end

  def vimeo_errors_notify(episodes, errors)
    @episodes = episodes
    @errors = errors
    AdminUser.all.each do |admin|
      mail(subject: "Ошибки видео c vimeo", to: admin.email)
    end
  end
end
