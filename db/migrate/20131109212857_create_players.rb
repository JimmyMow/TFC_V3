class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :number
      t.string :img_url
      t.integer :team_id
    end
  end
end
