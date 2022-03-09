class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
    Employee.create name: params['name'], position: params["position"], email:["email"], private_number:["private_number"]
    redirect_to action: :index
    end
end
