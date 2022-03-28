# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :branch
  belongs_to :role
  has_many :records

  def self.employee_by_number! private_number
    employee = self.select(:id).where(private_number:private_number).first
    employee.id
  end

  def self.list(name)
    employees = if name
                  where('name LIKE ?', "%#{name.upcase}%")
                else
                  all
                end
    employees.order(:id)
  end

  def self.create_employee(params)
    name = params[:employee][:name].upcase
    create(name:name, role_id: params['role'], email: params[:employee][:email],
           branch_id: params['branch'], private_number: params[:employee][:private_number],
           status: true)
  end

  def update_employee(params)
    name = params[:employee][:name].upcase
    update(name:name, role_id: params['role'], email: params[:employee][:email],
           branch_id: params['branch'], private_number: params[:employee][:private_number])
  end
end
