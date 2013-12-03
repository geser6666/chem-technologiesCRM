class StaticPagesController < ApplicationController
	include SessionsHelper
	before_filter :signed_in_user, only: [:adminpage]
  
	def home
		
	end 
	def adminpage
	
	end

	 

end
