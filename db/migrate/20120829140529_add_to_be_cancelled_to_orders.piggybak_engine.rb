# This migration comes from piggybak_engine (originally 20120815205207)
class AddToBeCancelledToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :to_be_cancelled, :boolean, :nil => false, :default => false
  end
end
