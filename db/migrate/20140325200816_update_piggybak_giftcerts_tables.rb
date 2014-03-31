class UpdatePiggybakGiftcertsTables < ActiveRecord::Migration
  def change
    rename_table :giftcerts, :piggybak_giftcerts_giftcerts
    rename_table :buyable_giftcerts, :piggybak_giftcerts_buyable_giftcerts
    rename_table :giftcert_applications, :piggybak_giftcerts_giftcert_applications
  end
end
