class CouponDecimalFieldUpdate < ActiveRecord::Migration
  def up
    change_column :coupons, :amount, :decimal, :precision => 10, :scale => 2, :null => false
    change_column :coupons, :min_cart_total, :decimal, :precision => 10, :scale => 2, :null => false
  end

  def down
    change_column :coupons, :amount, :decimal
    change_column :coupons, :min_cart_total, :decimal
  end
end
