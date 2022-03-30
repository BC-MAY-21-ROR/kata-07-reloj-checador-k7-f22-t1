require 'faker'
desc 'Populates the database with sample data'
  task data: :environment do
    employee = rand(3)
    150.times{|d|
              (Employee.first.id .. Employee.last.id).each_with_index do  |e|
              puts e
              Record.create! employee_id: e, check_in: Time.now.midnight-d.day+8.hours, check_out: Time.now.midnight-d.day+16.hours
              end}
  end

  task employee: :environment do
    employee = rand(3)
    100.times{
      name = Faker::Name.name
      email = Faker::Internet.email
      branch = rand(1..Branch.count)
      role = rand(1..Role.count)
      private_number = Faker::Number.number(digits: 5)
      Employee.create(name: name, email: email, role_id: role, private_number: private_number, status: true , branch_id: branch)
    }
  end

  task roles: :environment do
    15.times{
      position = Faker::Job.position
      Role.create(description:position)
    }
  end
