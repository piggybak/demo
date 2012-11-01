class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :title, :null => false
      t.string :slug, :null => false
      t.text :description
      
      t.string :main_file_name
      t.string :main_content_type
      t.string :main_file_size
      t.datetime :main_updated_at

      t.timestamps
    end
  end
end
