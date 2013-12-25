class PagesController < ApplicationController

def home

end

def stats
  @refs = Ref.all
  @players = Player.all
  @teams = Team.all
end

def contact

end

end
