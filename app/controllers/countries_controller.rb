class CountriesController < ApplicationController
	include SessionsHelper
     before_filter :signed_in_user
 
	def index 
		@countries = Country.paginate(page: params[:page])
	end
end
