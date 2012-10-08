class LineItemRearchitecture < ActiveRecord::Migration
  def up
    add_column :line_items, :reference_type, :string, :null => false, :default => "Variant"
    rename_column :line_items, :price, :unit_price
    rename_column :line_items, :total, :price
    add_column :line_items, :reference_id, :integer
    remove_column :line_items, :variant_id
    add_column :line_items, :sort, :integer, :null => false, :default => 0
    change_table(:line_items) do |t|
      t.timestamps
    end

    # Foreach shipment, payment, tax, and adjustment
    # Create lineitem with reference information and total

    # Drop total field from shipment and payment
    # Drop tax_charge from orders
  end

  def down
    remove_column :line_items, :updated_at
    remove_column :line_items, :created_at
    remove_column :line_items, :sort
    remove_column :line_items, :reference_type
    rename_column :line_items, :price, :total
    rename_column :line_items, :unit_price, :price
    add_column :line_items, :variant_id, :integer, :null => false
    remove_column :line_items, :reference_id
  end
end
