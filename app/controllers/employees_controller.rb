# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :new_form, only: [:new, :edit]
  before_action :list_employees, only: [:new, :index, :edit]
  before_action :find_employee, only: [:edit, :update, :update_status]
  after_action :close_form, only: [:create, :update]
  def index
  end

  def new
    @employee = Employee.new
    render 'index'
  end

  def create
    name = params[:employee][:name].upcase
    Employee.create name: name, role_id: params['role'], 
                    email: params[:employee][:email], branch_id: params['branch'], 
                    private_number: params[:employee][:private_number], status: true
    redirect_to action: :index
  end

  def edit
    render 'index'
  end

  def update
    name = params[:employee][:name].upcase
    @employee.update(name: name, role_id: params['role'], 
                    email: params[:employee][:email], branch_id: params['branch'], 
                    private_number: params[:employee][:private_number])
    redirect_to action: :index
  end

  def update_status
    status = !@employee.status
    @employee.update status: status
    redirect_to action: :index
  end

  def new_form
    @branches = Branch.all
    @roles = Role.all
    @form = true
  end

  def list_employees
    if params["name"]
      employees = Employee.where("name LIKE ?", "%#{params["name"].upcase}%")
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
