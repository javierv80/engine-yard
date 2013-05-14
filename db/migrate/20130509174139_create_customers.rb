class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :user
      t.string :phone
      t.string :name
      t.string :street
      t.integer :number
      t.string :department

      t.timestamps
    end
    add_index :customers, :user_id
  end
end
