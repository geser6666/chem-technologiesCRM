class StaticPagesController < ApplicationController
	include SessionsHelper

	def adminpage
		
		@contacttypes=ContactType.paginate(page: params[:page])
	end	
	 

end
