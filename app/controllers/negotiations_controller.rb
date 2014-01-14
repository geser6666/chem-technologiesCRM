class NegotiationsController < ApplicationController
	include NegotiationsHelper
  def new
  end
  def index
    @clients = Client.paginate(page: params[:page])	
	if !params[:client_id].nil?
		@client = Client.find(params[:client_id])
	    @negotiations = @client.negotiations
	
	end
  end
  
end
