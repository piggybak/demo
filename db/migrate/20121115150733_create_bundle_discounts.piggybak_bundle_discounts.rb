class CreateBundleDiscounts < ActiveRecord::Migration
  def up
    create_table :bundle_discounts do |t|
      t.string :name, :null => false
      t.float :discount, :null => false
      t.boolean :multiply, :null => false, :default => false
      t.datetime :active_until

      t.timestamps
    end
    
    create_table :bundle_discount_sellables do |t|
      t.integer :bundle_discount_id, :null => false
      t.integer :sellable_id, :null => false
    end
  end

  def down
    drop_table :bundle_discounts
    drop_table :bundle_discount_sellables
  end
end
