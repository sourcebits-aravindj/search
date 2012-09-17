class Web < ActiveRecord::Base
   has_many :webcontainers	
  attr_accessible :word, :status
end
