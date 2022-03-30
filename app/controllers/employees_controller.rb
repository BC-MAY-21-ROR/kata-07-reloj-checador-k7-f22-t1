# frozen_string_literal: true

# class EmployeesController
class EmployeesController < ApplicationController
  before_action :new_form, only: %i[new edit]
  before_action :list_employees, only: %i[new index edit]
  before_action :find_employee, only: %i[edit update update_status]
  def index; end

  def new
    @employee = Employee.new
    render 'index'
  end

  def create
    Employee.create_employee(params)
    redirect_to action: :index
  end

  def edit
    render 'index'
  end

  def update
    @employee.update_employee(params)
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
  end

  def list_employees
    @employees = Employee.list(params['name'])
  end

  def find_employee
    @employee = Employee.find(params['id'])
  end
end
