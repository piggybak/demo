class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :billing_address, :null => false
      t.references :shipping_address, :null => false

      t.references :user
      t.string :email, :null => false
      t.string :phone, :null => false

      t.float :total, :null => false, :scale => 2
      t.float :total_due, :null => false, :scale => 2
      t.float :tax_charge, :null => false, :scale => 2
      t.string :status, :null => false

      t.timestamps
    end
  end
end
