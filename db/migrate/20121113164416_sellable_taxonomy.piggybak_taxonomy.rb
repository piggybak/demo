# This migration comes from piggybak_taxonomy (originally 20121109164810)
class SellableTaxonomy < ActiveRecord::Migration
  def change
    create_table :sellable_taxonomies do |t|
      t.references :navigation_node, :null => false
      t.references :sellable, :null => false
      t.integer :sort, :null => false, :default => 0
    end
  end
end
