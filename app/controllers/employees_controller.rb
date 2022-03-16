# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    Employee.create name: params[:employee][:name], position: params[:employee][:position], 
                    email: params[:employee][:email], branch: params['branch'], 
                    private_number: params[:employee][:private_number], status: 1
    redirect_to action: :index
  end

  def edit
    @employee = Employee.find(params['id'])
    puts @employee.private_number
  end

  def update
    employee = Employee.find(params['id'])
    employee.update(name: params[:employee][:name], position: params[:employee][:position], 
                    email: params[:employee][:email], branch: params['branch'], 
                    private_number: params[:employee][:private_number])
    redirect_to action: :index
  end

  def show
    employee = Employee.find(params['id'])
    employee.update status: 0
    redirect_to action: :index
  end
end
