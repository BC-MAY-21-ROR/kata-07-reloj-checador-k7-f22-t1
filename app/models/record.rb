# frozen_string_literal: true

class Record < ApplicationRecord
  belongs_to :employee
  @today = time_range = (Time.now.midnight)..(Time.now.midnight + 1.day - 1.second)

  def self.last_record! id_employee
   self.joins(:employee).where(employee: { id: id_employee }, check_out: nil,
      created_at: @today)
  end

  def self.check_in! id_employee
    current_time = Time.now
    check_in =  self.create! employee_id: id_employee, check_in: current_time
    check_in.check_in.localtime
  end

  def self.check_out! record
    current_time = Time.now
    hours = format('%.2f', ((current_time.to_time - record.check_in) / 1.hour))
    check_out =self.update(record.id, check_out: current_time, hours: hours)
    check_out.check_out.localtime
  end
end
