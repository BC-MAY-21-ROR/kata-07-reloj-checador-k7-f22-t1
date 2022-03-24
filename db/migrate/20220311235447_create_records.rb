class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.decimal :hours
      t.timestamps
    end
  end
end
