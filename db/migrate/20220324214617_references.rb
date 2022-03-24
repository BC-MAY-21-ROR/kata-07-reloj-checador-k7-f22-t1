class References < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :role, foreign_key: true
    add_reference :employees, :branch, foreign_key: true
    add_reference :records, :employee, foreign_key: true
  end
end
