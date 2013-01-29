class ContactsController < ApplicationController
  def show
    @contact = ContactInfo.first
    @seo_tags = VirtualPage.find_by_name('contacts').seo_tags
    @head_section = 'about_studio'
    @submenu_section = 'contacts'
  end
end
