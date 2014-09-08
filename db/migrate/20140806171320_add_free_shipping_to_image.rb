class AddFreeShippingToImage < ActiveRecord::Migration
  def change
    add_column :images, :free_shipping, :boolean, :null => false, :default => false
  end
end
