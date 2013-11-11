class CreateCallVotes < ActiveRecord::Migration
  def change
    create_table :call_votes do |t|
      t.integer :user_id
      t.integer :call_id
      t.boolean :vote
    end
  end
end
