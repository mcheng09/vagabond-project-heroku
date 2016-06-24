class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
