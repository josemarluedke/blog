class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :category, null: false
      t.references :post, null: false

      t.timestamps
    end
    add_index :categorizations, :category_id
    add_index :categorizations, :post_id
  end
end
