class NegotiationsController < ApplicationController
  def new
  end
  def index
    @clients = Client.paginate(page: params[:page])	
  end
  
end
