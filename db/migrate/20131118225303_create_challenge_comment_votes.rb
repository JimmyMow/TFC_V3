class CreateChallengeCommentVotes < ActiveRecord::Migration
  def change
    create_table :challenge_comment_votes do |t|
      t.integer :user_id
      t.integer :challenge_comment_id
      t.boolean :vote
      t.timestamps
    end
  end
end
