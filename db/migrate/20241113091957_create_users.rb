class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :phone_number
      t.string :email, null: false
      t.string :user_type, null: false, default: 'new_parent', index: true
      t.integer :groups_count, default: 0
      t.integer :posts_count, default: 0

      t.timestamps
    end
  end
end
