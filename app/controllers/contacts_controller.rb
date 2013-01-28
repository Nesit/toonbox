class ContactsController < ApplicationController
  def show
    @contact = ContactInfo.first
  end
end
