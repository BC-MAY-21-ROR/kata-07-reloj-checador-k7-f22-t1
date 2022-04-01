require 'faker'
desc 'Populates the database with sample data'
task data: :environment do
  employee = rand(3)
  10.times do |d|
    (Employee.first.id..Employee.last.id).each do |e|
      puts e
      Record.create! employee_id: e, check_in: Time.now.midnight - d.day + 8.hours,
                     check_out: Time.now.midnight - d.day + 16.hours
    end
  end
end

task employee: :environment do
  employee = rand(3)
  100.times do
    name = Faker::Name.name
    email = Faker::Internet.email
    branch = rand(1..Branch.count)
    role = rand(1..Role.count)
    private_number = Faker::Number.number(digits: 5)
    Employee.create(name:, email:, role_id: role, private_number:, status: true,
                    branch_id: branch)
  end
end

task roles: :environment do
  15.times do
    position = Faker::Job.position
    Role.create(description: position)
  end
end

task branch: :environment do
  branch = rand(3)
  100.times do
    name = Faker::Name.name
    address = Faker::Address.city
    Branch.create(name:, address:)
  end
end
