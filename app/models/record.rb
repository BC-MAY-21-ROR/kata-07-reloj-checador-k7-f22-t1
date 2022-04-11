# frozen_string_literal: true

# Class of Records about checks of employees
class Record < ApplicationRecord
  belongs_to :employee
  @today = (Time.now.midnight)..(Time.now.midnight + 1.day - 1.second)

  def self.last_record!(id_employee)
    joins(:employee).where(employee: { id: id_employee }, check_out: nil,
                           created_at: @today)
  end

  def self.check_in!(id_employee)
    current_time = Time.now
    check_in = create! employee_id: id_employee, check_in: current_time
    check_in.check_in.localtime
  end

  def self.check_out!(record)
    current_time = Time.now
    hours = format('%.2f', ((current_time.to_time - record.check_in) / 1.hour))
    check_out = update(record.id, check_out: current_time, hours:hours)
    check_out.check_out.localtime
  end

  def self.search_by_day!(day, role_id, name, id_branch)
    day = day.blank? ? Time.now : day
    day = day.to_datetime
    date_range = (day.midnight)..(day.midnight + 1.day - 1.second)
    employee = Employee.joins(:records, :role).select(
      'employees.*, records.check_in as check_in, records.check_out as check_out, records.hours as hours, roles.description as position'
    ).where(
      employees: { branch_id: id_branch }, records: { check_in: date_range }
    )
    employee = employee.where({ role_id: role_id }) if role_id.present?
    employee = employee.where('employees.name LIKE ?', "%#{name}%") if name.present?
    employee
  end

  def self.attendance_by_month!(_branch_id)
    records = Record.all.joins(:employee).select(:hours,
                                                 :check_out).where(employee: { branch_id: 2 }).where.not(check_out: [nil])
    data = records.group_by { |t| t.check_out.strftime('%B/%Y') }
    data.each do |key, value|
      average_hours = 0
      value.each_with_index do |i, _v|
        average_hours += i.hours
        data[key] = average_hours / value.length
      end
    end
    data = data.to_a.reverse.to_h
  end

  def self.absence_by_month!(branch_id)
    branch = Branch.find(branch_id)
    employees = branch.employees
    absences = {}
    employees.each do |employee|
      employee.records.each do |record|
        month = record.check_in.month
        year = record.check_in.year
        next if month == Time.now.month

        if absences[Date::MONTHNAMES[month]].nil?
          absences[Date::MONTHNAMES[month]] =
            (Time.days_in_month(month, year) * employees.count)
        end
        absences[Date::MONTHNAMES[month]] -= 1
      end
    end
    absences = absences.to_a.reverse.to_h
  end
end
