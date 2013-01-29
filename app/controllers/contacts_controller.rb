class ContactsController < ApplicationController
  def show
    @contact = ContactInfo.first
    @seo_tags = VirtualPage.find_by_name('contacts').seo_tags
  end
end
