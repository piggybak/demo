class UpdatePiggybakTaxonomyTables < ActiveRecord::Migration
  def change
    rename_table :navigation_nodes, :piggybak_taxonomy_navigation_nodes
    rename_table :sellable_taxonomies, :piggybak_taxonomy_sellable_taxonomies
  end
end
