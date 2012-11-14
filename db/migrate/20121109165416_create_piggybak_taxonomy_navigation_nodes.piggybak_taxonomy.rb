class CreatePiggybakTaxonomyNavigationNodes < ActiveRecord::Migration
  def change
    create_table :navigation_nodes do |t|
      t.string :title
      t.string :slug
      t.string :position
      t.string :ancestry
      t.timestamps
    end

    add_index :navigation_nodes, :ancestry
  end
end
