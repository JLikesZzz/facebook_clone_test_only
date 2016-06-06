class AddColumn < ActiveRecord::Migration
  def change
    remove_column :statuses, :content
    add_column :statuses, :content, :text
  end
end
