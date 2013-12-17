# encoding: utf-8 
class ContacttypesController < ApplicationController
  def index
    @contacttypes = Contacttype.paginate(page: params[:page])
    @contacttype = Contacttype.new

  end

  def edit
     @contacttype = Contacttype.find(params[:id])
  end
  def update
          @contacttype = Contacttype.find(params[:id])
                if @contacttype.update_attributes(params[:contacttype])
                        flash[:success] = "Contacttye updated"
                        redirect_to contacttypes_path
                else
                        render 'edit'
                end
  end

  def destroy
  	 @contacttype = Contacttype.find(params[:id])

    Contacttype.find(params[:id]).destroy
      flash[:success] = "Contacttype destroyed."
      redirect_to contacttypes_path

  end
  def create

  	@contacttype = Contacttype.new(params[:contacttype])

      if @contacttype.save
        flash[:success] = "contacttype created!"
        redirect_to contacttypes_path
      else
        #flash[:success] = "error! country DON'T created!"
        #redirect_to countries_path
        @contacttypes = Contacttype.paginate(page: params[:page])
        render 'index'
      end
  end

end
