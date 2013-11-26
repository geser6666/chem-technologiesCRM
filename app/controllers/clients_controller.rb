class ClientsController < ApplicationController
	include SessionsHelper
	before_filter :signed_in_user

	def index
		@clients = Client.paginate(page: params[:page])
	end
end
