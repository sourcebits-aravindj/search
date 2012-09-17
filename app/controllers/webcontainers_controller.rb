class WebcontainersController < ApplicationController
	def new
		 @word=Rails.cache.read("word")
		 @word_id=Rails.cache.read("word_id")
		 @containers=Container.all
		 
		 @containers.each do |p|
		 	obj=Webcontainer.new
		 	obj.add("/home/sourcebits/search/public/search.html",@word,@word_id)
		 	#obj.save
		 end
	end
end
