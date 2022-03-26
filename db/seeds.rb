# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

branches = Branch.create([{name: "Colima", address: "Av. Rio Colima"}, {name: "Tecoman", address: "Laguna de chamala"}  ])
roles = Role.create([{description: "Boss"}, {description: "Assistant"}, {description: "chalan xd"}])
employees = Employee.create([{name: "Juan Perez", email: "juan@g.com", role_id: roles.first, private_number: 12345, status: "active", branch_id: branches.first},{name: "Luis Lopez", email: "Luis@g.com", role_id: roles.first, private_number: 1234, status: "active", branch_id: branches.first}, ])
