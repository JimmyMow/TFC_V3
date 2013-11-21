class CreateChallengeComments < ActiveRecord::Migration
  def change
    create_table :challenge_comments do |t|
      t.text :text
      t.integer :challenge_id
      t.integer :user_id
      t.timestamps
    end
  end
end
