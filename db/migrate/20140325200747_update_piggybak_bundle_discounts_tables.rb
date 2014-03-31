class UpdatePiggybakBundleDiscountsTables < ActiveRecord::Migration
  def change
    rename_table :bundle_discounts, :piggybak_bundle_discounts_bundle_discounts
    rename_table :bundle_discount_sellables, :piggybak_bundle_discounts_bundle_discount_sellables
  end
end
