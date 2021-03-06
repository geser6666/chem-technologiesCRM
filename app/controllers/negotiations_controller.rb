# encoding: utf-8
class NegotiationsController < ApplicationController
	include NegotiationsHelper
	include SessionsHelper
  def new
  end
  def index
    @clients = Client.paginate(page: params[:page])	

	  if !params[:client_id].nil?
		  @client = Client.find(params[:client_id])
	    @negotiations = @client.negotiations.paginate(page: params[:page]) 
	    @negotiation=@client.negotiations.build(user_id: 1)
    end
  end
  def create
  #	if !params[:negotiation_client_id].nil?
  		@client = Client.find(params[:client_id])
  		 @negotiation=@client.negotiations.build(value: params[:negotiation][:value], user_id:params[:negotiation][:user_id] )
  		 if @negotiation.save
       		flash[:success] = "Micropost created!"
       		redirect_to client_negotiations_path(@client)
   	   # end
     else
       redirect_to negotiations_path
     end
  end
  def edit

     @clients = Client.paginate(page: params[:page])  
     if !params[:client_id].nil?
      @client = Client.find(params[:client_id])
      @negotiations = @client.negotiations.paginate(page: params[:page]) 
      @negotiation = Negotiation.find(params[:id])
    end
  end
  def update
    if !params[:client_id].nil?
      @client = Client.find(params[:client_id])
      @negotiation = Negotiation.find(params[:id])
      if @negotiation.update_attributes(params[:negotiation])
        flash[:success] = "Сохранение прошло успешно"
        redirect_to client_negotiations_path(@client)
      else
        render 'edit'
      end
    end  
  end


  
end
