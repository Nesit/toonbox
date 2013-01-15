class Movie < ActiveRecord::Base
  translates :title, :description

  attr_accessible :title, :description
end
