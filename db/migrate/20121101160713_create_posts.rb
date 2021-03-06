class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :slug, null: false

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
