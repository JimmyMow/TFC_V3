class PagesController < ApplicationController

def home

end

def stats
  # @refs = Ref.all.sort_by! { |x| x.calls.count }.reverse!.slice(0,5)
  @refs = Ref.all
  @players = Player.all
  @teams = Team.all
end

def contact

end

end
