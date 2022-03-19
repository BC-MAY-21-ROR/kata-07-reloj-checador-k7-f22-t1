# frozen_string_literal: true

class RecordsController < ApplicationController

  def index
    @records = Records.all
  end

  def new
    @record = Record.new
  end

  def create
    id_employee = Employee.employee_by_number! params['private_number']
    record = Record.last_record!(id_employee)
    if record.length.positive?
      check_out = Record.check_out! record[0]
      flash[:success] = "CheckOut at #{check_out.to_formatted_s(:short)}. Have a good night "
    else
      check_in =Record.check_in! id_employee
      flash[:success] = "CheckIn at #{check_in.to_formatted_s(:short)}. Have a nice day"
    end
    redirect_to action: :new
  rescue StandardError => e
    flash[:danger] = 'Private number not exist. Please try again'
    redirect_to action: :new
  end
end
