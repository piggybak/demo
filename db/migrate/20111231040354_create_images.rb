class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title, :null => false
      t.string :slug, :null => false
      t.text :description
      t.references :user, :null => false

      t.string :gallery_file_name
      t.string :gallery_content_type
      t.string :gallery_file_size
      t.datetime :gallery_updated_at

      t.string :main_file_name
      t.string :main_content_type
      t.string :main_file_size
      t.datetime :main_updated_at

      t.timestamps
    end
  end
end
