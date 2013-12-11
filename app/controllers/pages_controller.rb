class PagesController < ApplicationController

def home

end

def stats
  @refs = Ref.all.sort_by! { |x| x.calls.count }.reverse!.slice(0,5)
  @commit_players = Player.all.sort_by! { |x| x.fouls.count }.reverse!.slice(0,5)
  @fouled_players = Player.all.sort_by! { |x| x.fouls.count }.reverse!.slice(0,5)
end

end
