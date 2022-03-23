class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :name
      t.belongs_to :role, foreign_key: true
      t.boolean :status
      t.integer :private_number
      t.belongs_to :branch, foreign_key: true
      t.timestamps
    end
  end
end
