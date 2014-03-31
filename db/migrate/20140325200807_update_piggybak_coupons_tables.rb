class UpdatePiggybakCouponsTables < ActiveRecord::Migration
  def change
    rename_table :coupons, :piggybak_coupons_coupons
    rename_table :coupon_applications, :piggybak_coupons_coupon_applications
  end
end
