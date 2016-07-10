class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.integer :age, :null => false
      t.integer :salary, :null => false
      t.references :department, :null => false

      t.timestamps null: false
    end
  end
end
