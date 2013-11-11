class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :coach
      t.string :name
      t.string :img_url
    end
  end
end
