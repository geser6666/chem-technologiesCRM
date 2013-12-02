class RelationshipsController < ApplicationController
  include SessionsHelper
  before_filter :signed_in_user

  def create
    @client = Client.find(params[:relationship][:client_id])
    current_user.follow!(@client)
    redirect_to clients_path
  end

  def destroy
    @client = Relationship.find(params[:id]).client
    current_user.unfollow!(@client)
    redirect_to clients_path
  end
end