# frozen_string_literal: true

class RecordsController < ApplicationController
  def index
    @records = Records.all
  end

  def new
    @record = Record.new
  end

  def create
    id_employee = Employee.select(:id).where(private_number: params['private_number']).first
    puts id_employee
    time_range = (Time.now.midnight)..(Time.now.midnight + 1.day - 1.second)
    record = Record.joins(:employee).where(employee: { id: id_employee.id }, check_out: nil,
                                           created_at: time_range)
    time = Time.now
    if record.length.positive?
      Record.update(record[0].id, check_out: time, hours: helpers.deff_hours(record[0].check_in, time))
      flash[:success] = "CheckOut at #{time.to_formatted_s(:short)}. Have a good night "
    else
      Record.create! employee_id: id_employee.id, check_in: time
      flash[:success] = "CheckIn at #{time.to_formatted_s(:short)}. Have a nice day"
    end
    redirect_to action: :new
  rescue StandardError => e
    flash[:danger] = 'Private number not exist. Please try again'
    redirect_to action: :new
  end
end
