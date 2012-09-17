class Container < ActiveRecord::Base
  has_many :webcontainers
  attr_accessible :description, :title, :url
end
