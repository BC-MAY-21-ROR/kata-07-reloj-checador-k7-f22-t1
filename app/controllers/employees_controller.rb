# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :new_form, only: [:new, :edit]
  before_action :list_employees, only: [:new, :index, :edit]
  before_action :find_employee, only: [:edit, :update, :show]
  after_action :close_form, only: [:create, :update]
  def index
  end

  def new
    @employee = Employee.new
    render 'index'
  end

  def create
    Employee.create name: params[:employee][:name], role_id: params['role'], 
                    email: params[:employee][:email], branch_id: params['branch'], 
                    private_number: params[:employee][:private_number], status: true
    redirect_to action: :index
  end

  def edit
    render 'index'
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

  def new_form
    @branches = Branch.all
    @roles = Role.all
    @form = true
  end

  def list_employees
    if params["name"]
      employees = Employee.where("name LIKE ?", "%#{params["name"]}%")
    else
      employees = Employee.all
    end
    @employees = employees.order(:id) 
  end

  def find_employee
    @employee = Employee.find(params['id'])
  end
  
  def close_form
    @form = false
  end
end
