class NegotiationsController < ApplicationController
	include NegotiationsHelper
  def new
  end
  def index
    @clients = Client.paginate(page: params[:page])	
	if !params[:format].nil?
		@client = Client.find(params[:format])
	    @negotiations = @client.negotiations
	end
  end
  
end
