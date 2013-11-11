class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :call_id
      t.integer :user_id
      t.integer :challenge_id
    end
  end
end
