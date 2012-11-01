# This migration comes from piggybak_variants (originally 20121016150359)
class CreateOptions < ActiveRecord::Migration
  def up
    create_table :options, :force => true do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end
  end

  def down
    drop_table :options
  end
end
