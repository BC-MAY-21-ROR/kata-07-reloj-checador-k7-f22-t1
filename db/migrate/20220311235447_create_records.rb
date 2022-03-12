class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.belongs_to :employee, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out
      t.integer :hours
      t.timestamps
    end
  end
end
