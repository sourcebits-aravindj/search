class ContainersController < ApplicationController
	def index
		@contain=Container.all
		
	end
end
