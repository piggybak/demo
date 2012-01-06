class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :slug, :null => false

      t.references :user
   
      t.text :content 

      t.timestamps
    end
  end
end
