class CreateGameRefs < ActiveRecord::Migration
  def change
    create_table :game_refs do |t|
      t.integer :game_id
      t.integer :ref_id
    end
  end
end
