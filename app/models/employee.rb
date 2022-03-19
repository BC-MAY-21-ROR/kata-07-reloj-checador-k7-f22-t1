# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :branch
  belongs_to :role
  has_many :records

  def self.employee_by_number! private_number
    employee = self.select(:id).where(private_number: private_number).first
    employee.id
   end

end
