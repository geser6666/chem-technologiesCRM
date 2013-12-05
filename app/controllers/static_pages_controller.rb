class StaticPagesController < ApplicationController
	include SessionsHelper
	before_filter :signed_in_user, only: [:adminpage, :countries]
  
	def home
		
	end 
	def adminpage
	@countries = Country.all
	end

	def countries
		@countries = Country.all
		#paginate(page: params[:page])
	end
	 

end
