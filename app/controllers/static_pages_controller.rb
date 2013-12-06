class StaticPagesController < ApplicationController
	include SessionsHelper

	def adminpage
		@countries = Country.paginate(page: params[:page])
		@contacttypes=ContactType.paginate(page: params[:page])
	end	
	 

end
