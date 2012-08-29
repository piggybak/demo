# This migration comes from piggybak_engine (originally 20120718142841)
class ModifyCredits < ActiveRecord::Migration
  def change
    rename_table :credits, :adjustments
    add_column :adjustments, :note, :text
  end
end
