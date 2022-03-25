    desc 'Populates the database with sample data'
    task :data => :environment do
    branches = Branch.create!([{name: "Colima", address: "Av. Rio Colima"}, {name: "Tecoman", address: "Laguna de chamala"}  ])
    roles = Role.create!([{description: "Boss"}, {description: "Assistant"}])
    employees = Employee.create!([{name: "Juan Perez", email: "juan@g.com", role_id: 1, private_number: 12345, status: "active", branch_id: 1},{name: "Luis Lopez", email: "Luis@g.com", role_id: 2, private_number: 1234, status: "active", branch_id: 2}, ])
    end
