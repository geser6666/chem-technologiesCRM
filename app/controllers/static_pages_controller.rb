class StaticPagesController < ApplicationController
	include SessionsHelper

	def adminpage
		
		@contacttypes=Contacttype.paginate(page: params[:page])
	end	
	 

end
