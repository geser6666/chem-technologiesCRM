class CountriesController < ApplicationController
	include SessionsHelper
	def index
		redirect_to adminpage_path
	end
 end
