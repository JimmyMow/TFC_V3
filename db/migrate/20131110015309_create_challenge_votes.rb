class CreateChallengeVotes < ActiveRecord::Migration
  def change
    create_table :challenge_votes do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.boolean :vote
    end
  end
end
