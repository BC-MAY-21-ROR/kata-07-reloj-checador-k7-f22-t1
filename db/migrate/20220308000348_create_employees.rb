class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :name
      t.boolean :status
      t.integer :private_number
      t.timestamps
    end
  end
end
