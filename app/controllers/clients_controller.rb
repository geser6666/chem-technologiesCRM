# encoding: utf-8
class ClientsController < ApplicationController
	include SessionsHelper
	before_filter :signed_in_user

	def index
		@clients = Client.paginate(page: params[:page])
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(params[:client])
		if @client.save
			flash[:success] = "Клиент успешно создан."
			redirect_to @client
		else			
			render 'new'
		end
	end

	def show
		@client = Client.find(params[:id])
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(params[:client])
			flash[:success] = "Сохранение прошло успешно"
			redirect_to @client
		else
			render 'edit'
		end
	end
end
