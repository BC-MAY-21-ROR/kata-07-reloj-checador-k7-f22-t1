class RolesController < ApplicationController
  before_action :set_role, only: %i[show edit update destroy]
  def index;
    @roles = Role.all
  end
  def create
    Role.create description: params[:description]
    redirect_to action: :index
  end

  def edit
  end

  def update
    respond_to do |format|
      if @role.update(branch_params)
        format.html { redirect_to roles_path, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

end
