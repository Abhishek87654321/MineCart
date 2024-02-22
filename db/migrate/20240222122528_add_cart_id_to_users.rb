class AddCartIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cart_id, :integer
  end
end
