class AddTimestaps < ActiveRecord::Migration
  def change
    add_column :call_votes, :created_at, :datetime
    add_column :call_votes, :updated_at, :datetime

    add_column :calls, :created_at, :datetime
    add_column :calls, :updated_at, :datetime

    add_column :challenge_votes, :created_at, :datetime
    add_column :challenge_votes, :updated_at, :datetime

    add_column :challenges, :created_at, :datetime
    add_column :challenges, :updated_at, :datetime

    add_column :comment_votes, :created_at, :datetime
    add_column :comment_votes, :updated_at, :datetime

    add_column :comments, :created_at, :datetime
    add_column :comments, :updated_at, :datetime

    add_column :game_refs, :created_at, :datetime
    add_column :game_refs, :updated_at, :datetime

    add_column :games, :created_at, :datetime
    add_column :games, :updated_at, :datetime

    add_column :players, :created_at, :datetime
    add_column :players, :updated_at, :datetime

    add_column :refs, :created_at, :datetime
    add_column :refs, :updated_at, :datetime

    add_column :teams, :created_at, :datetime
    add_column :teams, :updated_at, :datetime

    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
  end


end
