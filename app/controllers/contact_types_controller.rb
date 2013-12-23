class ContactTypesController < ApplicationController
	include SessionsHelper
	def index
		@contacttypes = ContactType.all
	end

end
