class RolesController < ApplicationController
  def index;
    @roles = Role.all
  end
  def create
    Role.create description: params[:description]
    redirect_to action: :index
  end

end
