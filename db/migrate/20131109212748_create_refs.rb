class CreateRefs < ActiveRecord::Migration
  def change
    create_table :refs do |t|
      t.string :name
      t.string :img_url
    end
  end
end
