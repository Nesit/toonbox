class PersonsController < ApplicationController
  def index
    @staffs = Staff.all
  end
end
