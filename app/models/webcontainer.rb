require 'nokogiri'
class Webcontainer < ActiveRecord::Base
  belongs_to :web
  belongs_to :container
  attr_accessible :occu, :weight 
end
