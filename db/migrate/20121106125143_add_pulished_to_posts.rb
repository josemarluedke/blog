class AddPulishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published, :boolean, default: false
  end
end
