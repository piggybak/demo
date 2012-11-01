# This migration comes from piggybak_variants (originally 20121016161156)
class CreateOptionValuesVariants < ActiveRecord::Migration
  def up
    create_table :option_values_variants, :id => false do |t|
      t.integer :option_value_id
      t.integer :variant_id
    end
  end

  def down
    drop_table :option_values_variants
  end
end
