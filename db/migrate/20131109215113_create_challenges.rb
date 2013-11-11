class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :call_type
      t.string :quarter
      t.string :time
      t.integer :game_id
      t.string :description
      t.integer :commit_player_id
      t.integer :fouled_player_id
      t.integer :ref_id
      t.integer :user_id
    end
  end
end
