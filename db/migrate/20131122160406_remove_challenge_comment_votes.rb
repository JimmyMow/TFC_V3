class RemoveChallengeCommentVotes < ActiveRecord::Migration
  def change
    drop_table :challenge_comment_votes
  end
end
