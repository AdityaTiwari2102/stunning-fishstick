class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :title, null: false
      t.integer :posts_count, default: 0
      t.integer :users_count, default: 0

      t.timestamps
    end
  end
end
