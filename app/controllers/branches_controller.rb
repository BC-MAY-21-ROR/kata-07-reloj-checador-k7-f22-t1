# frozen_string_literal: true

# class controller for branches
class BranchesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_branch, only: %i[show edit update destroy]
  before_action :filter, :attendance_by_month, :absences_by_month, only: [:show]

  # GET /branches or /branches.json
  def index
    @branches = Branch.all.where('name LIKE ?', "%#{params[:q]}%")
    @branch = Branch.new
  end

  # GET /branches/1 or /branches/1.json
  def show
    puts "::::::::::"
    puts "show"
    puts params["day"]
    puts "::::::::::"
  end

  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit; end

  # POST /branches or /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_url, notice: 'Branch was successfully created.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1 or /branches/1.json
  def update
    puts "UPDATEz"
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to branch_url(@branch), notice: 'Branch was successfully upd.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1 or /branches/1.json
  def destroy
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def filter
    puts "::::::::::"
    puts "HERE 1"
    puts params
    puts "::::::::::"
    @attendance_total = Employee.where({ branch_id: 1 }).count
    @employees = Record.search_by_day! params[:day], params[:role_id], params[:name], @branch
  end

  def absences_by_month
    @absence_by_month = Record.absence_by_month! @branch.id
  end

  def attendance_by_month
    @attendance_by_month = Record.attendance_by_month! @branch.id
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_branch
    puts params[:id]
    @branch = Branch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def branch_params
    params.require(:branch).permit(:name, :address)
  end
end
