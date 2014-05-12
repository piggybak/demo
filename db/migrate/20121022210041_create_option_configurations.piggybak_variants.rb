# This migration comes from piggybak_variants (originally 20121022205428)
class CreateOptionConfigurations < ActiveRecord::Migration
  def up
    create_table :option_configurations, :force => true do |t|
      t.string :klass, :null => false
      t.references :option, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :option_configurations
  end
end
