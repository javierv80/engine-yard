class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user	
      t.string :name
      t.decimal :price
      

      t.timestamps
    end
    add_index :products, :user_id
  end
end
