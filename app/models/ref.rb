class Ref < ActiveRecord::Base
  has_many :game_refs
  has_many :games, through: :game_refs
  has_many :calls
  has_many :challenges

  # scope :top, -> { Ref.all.sort_by! { |x| x.calls.count }.reverse!.slice(0,5) }
end
