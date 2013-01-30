# -*- coding: utf-8 -*-
class ResumeMailer < ActionMailer::Base
  default from: "info@#{ActionMailer::Base.default_url_options[:host]}"

  def new_resume_notify(job_request)
    @job_request = job_request
    AdminUser.with_receive_resume.each do |admin|
      mail(subject: "Новое резюме на вакансию #{@job_request.job_position.title}",
           to: admin.email)
    end

  end
end
