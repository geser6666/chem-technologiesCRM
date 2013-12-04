<<<<<<< HEAD
class StaticPagesController < ApplicationController
	include SessionsHelper
	def home
		
	end 
end
=======
class StaticPagesController < ApplicationController
	include SessionsHelper
	before_filter :signed_in_user, only: [:adminpage, :countries]
  
	def home
		
	end 
	def adminpage
	@countries = Country.all
	end

	def countries
		@countries = Country.all
		#paginate(page: params[:page])
	end
	 

end
>>>>>>> a817b5f59aee7b42b6dd917e2d5547bf190912ce
