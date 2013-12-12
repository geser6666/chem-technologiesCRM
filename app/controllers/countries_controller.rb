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
       render 'static_pages/home'
      end
    end
	def index
		@countries = Country.all
		#paginate(page: params[:page])
		@country = Country.new
		
	end

	def edit
		  @country = Country.find(params[:id])
		  if @country.save
      		flash[:success] = "country created!"
      		redirect_to countries_path
    	  else
      		@feed_items = []
      		render 'static_pages/home'
    	  end
	end
	def update
		  @country = Country.find(params[:id])
                if @country.update_attributes(params[:country])
                     #   flash[:success] = "Сохранение прошло успешно"
                        redirect_to adminpage_path
                else
                        render 'edit'
                end
	end
 end
