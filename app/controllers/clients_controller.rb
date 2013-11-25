class ClientsController < ApplicationController
	include SessionsHelper
	before_filter :signed_in_user

	def index
		@clients = Client.all
	end
end
