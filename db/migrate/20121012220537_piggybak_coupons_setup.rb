class PiggybakCouponsSetup < ActiveRecord::Migration
  def up
    create_table :coupons do |t|
      t.string :code, :null => false
      t.decimal :amount, :null => false
      t.string :discount_type, :null => false
      t.decimal :min_cart_total, :null => false
      t.date :expiration_date
      t.integer :allowed_applications
    end
    create_table :coupon_applications do |t|
      t.references :line_item
      t.references :coupon
    end
  end

  def down
    drop_table :coupons    
    drop_table :coupon_applications
  end
end
