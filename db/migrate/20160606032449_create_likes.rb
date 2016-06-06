class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :status_id

      t.timestamps null: false
    end

    create_table :statuses do |t|
      t.integer :user_id
      t.string :title
      t.string :content


      t.timestamps null: false
    end
  end
end
