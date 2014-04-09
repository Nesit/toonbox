class View < ActiveRecord::Base
  def self.columns 
    @columns ||= []
  end
end