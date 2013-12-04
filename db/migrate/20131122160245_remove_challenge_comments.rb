class RemoveChallengeComments < ActiveRecord::Migration
  def change
    drop_table :challenge_comments
  end
end
