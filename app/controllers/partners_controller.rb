class PartnersController < ApplicationController
  def index
    @partners = Partner.all
    @seo_tags = VirtualPage.find_by_name('partners').seo_tags
  end
end
