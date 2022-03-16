# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :list_branches_and_roles, only: [:new, :edit]
  before_action :find_employee, only: [:edit, :update, :show]
  def index
    @employees = Employee.all
  end

  def list_branches_and_roles
    @branches = Branch.all
    @roles = Role.all
  end

  def find_employee
    @employee = Employee.find(params['id'])
  end

  def new
    @employee = Employee.new
  end

  def create
    Employee.create name: params[:employee][:name], role_id: params['role'], 
                    email: params[:employee][:email], branch_id: params['branch'], 
                    private_number: params[:employee][:private_number], status: true
    redirect_to action: :index
  end

  def edit
  end

  def update
    @employee.update(name: params[:employee][:name], role_id: params['role'], 
                    email: params[:employee][:email], branch_id: params['branch'], 
                    private_number: params[:employee][:private_number])
    redirect_to action: :index
  end

  def show
    @employee.update status: false
    redirect_to action: :index
  end
end
