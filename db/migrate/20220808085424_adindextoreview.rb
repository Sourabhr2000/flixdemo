class Adindextoreview < ActiveRecord::Migration[6.1]
  def change
    add_index :reviews, :user_id
  end
end
