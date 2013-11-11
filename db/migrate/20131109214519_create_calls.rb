class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :call_type
      t.string :quarter
      t.string :time
      t.integer :game_id
      t.string :description
      t.integer :commit_player_id
      t.integer :fouled_player_id
      t.integer :ref_id
    end
  end
end
