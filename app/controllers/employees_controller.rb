# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    Employee.create name: params[:name], position: params[:position], email: params[:email], 
                    branch: params['branch'], private_number: [:private_number], status: 1
    redirect_to action: :index
  end

  def edit
    @employee = Employee.find(params['id'])
  end

  def update
    employee = Employee.find(params['id'])
    employee.update name: params['name'], position: params['position'], email: params['email'],
                    private_number: ['private_number'], branch: params['branch']
    redirect_to action: :index
  end

  def show
    employee = Employee.find(params['id'])
    employee.update status: 0
    redirect_to action: :index
  end
end
