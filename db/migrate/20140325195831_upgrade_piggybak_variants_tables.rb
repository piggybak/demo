class UpgradePiggybakVariantsTables < ActiveRecord::Migration
  def change
    rename_table :variants, :piggybak_variants_variants
    rename_table :options, :piggybak_variants_options
    rename_table :option_values, :piggybak_variants_option_values
    rename_table :option_values_variants, :piggybak_variants_option_values_variants
    rename_table :option_configurations, :piggybak_variants_option_configurations
  end
end
