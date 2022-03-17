class RecordsController < ApplicationController
  def index
    @records = Records.all
  end
  def new
    @record = Record.new
  end

  def create
    id_employee = Employee.select(:id).find_by(params[:private_number])
    ##Rang to evaluate if the record have a check in
    time_range = (Time.now.midnight)..(Time.now.midnight + 1.day-1.second)
    record = Record.joins(:employee).where(:employee=>{:id=>1}, :check_out=>nil, :created_at=>time_range)
    if record.length >0
      check_out = Time.now
      Record.update(record[0].id,:check_out => check_out, :hours=>helpers.deff_hours(record[0].check_in, check_out))
    else
      Record.create! employee_id: 1, check_in: Time.now
    end
  end
end
