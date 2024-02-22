class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :product_name
      t.string :quantity
      t.decimal :price_single
      t.integer :user_id

      t.timestamps
    end
  end
end
