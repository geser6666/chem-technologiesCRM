# encoding: utf-8
class CountriesController < ApplicationController
	before_filter :signed_in_user
	include SessionsHelper
	def new
	    if signed_in?
      		redirect_to root_path
    	else
        @country = Country.new
    	end
	end

    def create
    	@country = Country.new(params[:country])

      if @country.save
        flash[:success] = "country created!"
        redirect_to countries_path
      else
        #flash[:success] = "error! country DON'T created!"
        #redirect_to countries_path
        @countries = Country.paginate(page: params[:page])
        render 'index'
      end
    end
	def index
		@countries = Country.paginate(page: params[:page])
    @country = Country.new(params[:country])

		
	end

	def edit
		  @country = Country.find(params[:id])
  end

  def destroy
    @country = Country.find(params[:id])

    Country.find(params[:id]).destroy
      flash[:success] = "Country destroyed."
      redirect_to countries_path


  end

	def update
		  @country = Country.find(params[:id])
                if @country.update_attributes(params[:country])
                        flash[:success] = "Страна сохранена"
                        redirect_to countries_path
                else
                        render 'edit'
                end
	end
 end
