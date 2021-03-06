require 'uri'
require 'open-uri'
require 'nokogiri'


def team_coach(team_name)
  # FIND THE TEAM'S CODE
  season_schedule_url = Nokogiri::HTML(open('http://api.sportsdatallc.org/nba-t3/games/2013/reg/schedule.xml?api_key=2qdbfzmhgs94z524vxktzgfa'))
  puts
  games = season_schedule_url.xpath('//game')
  teams = []
  teams_code = Hash.new
  games.each do |game|
    away_team = game.xpath('away//@name') + game.xpath('away//@id')
    home_team = game.xpath('home//@name') + game.xpath('home//@id')
    away_name = game.xpath('away//@name').text
    away_id = game.xpath('away//@id').text
    teams_code["#{away_name}"] = "#{away_id}"
    teams << teams_code
  end
 @team_code = teams_code["#{team_name}"]
# USE CODE TO FIND TEAM'S ROSTER
  url = URI.encode("http://api.sportsdatallc.org/nba-t3/teams/#{@team_code}/profile.xml?api_key=2qdbfzmhgs94z524vxktzgfa")
  team_url = Nokogiri::HTML(open(url))
    coach = team_url.xpath('//coaches/coach/@full_name').first.value
    players_full_name = team_url.xpath('//players//@full_name')
    all_players = players_full_name.each do |player|
       player
    end
    return coach
end

def team_players(team_name)
  # FIND THE TEAM'S CODE
  season_schedule_url = Nokogiri::HTML(open('http://api.sportsdatallc.org/nba-t3/games/2013/reg/schedule.xml?api_key=2qdbfzmhgs94z524vxktzgfa'))
  games = season_schedule_url.xpath('//game')
  teams = []
  teams_code = Hash.new
  games.each do |game|
    away_team = game.xpath('away//@name') + game.xpath('away//@id')
    home_team = game.xpath('home//@name') + game.xpath('home//@id')
    away_name = game.xpath('away//@name').text
    away_id = game.xpath('away//@id').text
    teams_code["#{away_name}"] = "#{away_id}"
    teams << teams_code
  end
 @team_code = teams_code["#{team_name}"]
# USE CODE TO FIND TEAM'S ROSTER
  url = URI.encode("http://api.sportsdatallc.org/nba-t3/teams/#{@team_code}/profile.xml?api_key=2qdbfzmhgs94z524vxktzgfa")
  team_url = Nokogiri::HTML(open(url))
    coach = team_url.xpath('//coaches/coach/@full_name').first.value

      players_attributes = team_url.xpath('//players//@full_name') + team_url.xpath('//players//@jersey_number')
      players = team_url.xpath('//player')
      player_array = []
      players.each do |player|
        players_attributes = Hash.new
        players_attributes['name'] = player.xpath('@full_name').text.to_s
        players_attributes['number'] = player.xpath('@jersey_number').text.to_s
        player_array << players_attributes
      end

    return player_array

end

def wait
  return sleep 1.5
end


def nba_refs
  url = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/List_of_National_Basketball_Association_referees'))
  li = url.xpath('//li')
  refs = []
  li.each do |list|
    li_text = list.text
    if li_text[0..2] == "No."
      refs << li_text
    end
  end
  return refs
end

# CREATING ALL REFS
Ref.destroy_all
nba_refs.each do |ref|
  r = Ref.new
  r.name = ref.force_encoding("UTF-8")
  r.save
  wait
end


#CREATING TEAMS + COACH
teams = ['Atlanta Hawks', 'Brooklyn Nets', 'Boston Celtics', 'Charlotte Bobcats', 'Chicago Bulls', 'Cleveland Cavaliers', 'Dallas Mavericks', 'Denver Nuggets', 'Detroit Pistons', 'Golden State Warriors', 'Houston Rockets', 'Indiana Pacers', 'Los Angeles Clippers', 'Los Angeles Lakers', 'Memphis Grizzlies', 'Miami Heat', 'Milwaukee Bucks', 'Minnesota Timberwolves', 'New Orleans Pelicans', 'New York Knicks', 'Oklahoma City Thunder', 'Orlando Magic', 'Philadelphia 76ers', 'Phoenix Suns', 'Portland Trail Blazers', 'Sacramento Kings', 'San Antonio Spurs', 'Toronto Raptors', 'Utah Jazz', 'Washington Wizards']
team_img_url = %w[http://www.sportsmemorabilia.com/files/cache/8f1/Atlanta%20Hawks%20Memorabilia_8f1539507ec2fec29e5f707892e58db0.gif http://cdn.bleacherreport.net/images/team_logos/50x50/brooklyn_nets.png http://cdn.bleacherreport.net/images/team_logos/50x50/boston_celtics.png http://www.hardwoodcanvas.com/wp-content/uploads/2011/06/CharlotteBobcats.jpeg https://pbs.twimg.com/profile_images/2596506386/bulls_normal.png http://s7d2.scene7.com/is/image/Fathead/lgo_nba_cleveland_cavaliers?layer=comp&fit=constrain&hei=50&wid=200&fmt=png-alpha&qlt=95,0&op_sharpen=1&resMode=bicub&op_usm=0.0,0.0,0,0&iccEmbed=0 http://tribkdaf.files.wordpress.com/2013/10/dallas-mavericks.jpg?w=48&h=48&crop=1 https://4more.s3.amazonaws.com/teams/thumb_denver-nuggets.png http://cdn.bleacherreport.net/images/team_logos/50x50/detroit_pistons.png http://cdn.bleacherreport.net/images/team_logos/50x50/golden_state_warriors.png http://cdn.bleacherreport.net/images/team_logos/50x50/houston_rockets.png http://31.media.tumblr.com/avatar_fbd146137434_48.png http://cdn.bleacherreport.net/images/team_logos/50x50/los_angeles_clippers.png http://a1.twimg.com/profile_images/378800000113462800/7d6c261f318bf6383fde4cb76659edb1_normal.png http://flapship.com/wp-content/uploads/2012/10/memphis-grizzlies.jpg http://cdn.bleacherreport.net/images/team_logos/50x50/miami_heat.png http://uniformcritics.com/unis/logos/teams/milwaukee-bucks.png https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/s48x48/1086585_578658912169710_1132966899_q.jpg http://s3.amazonaws.com/image.chatsports.com/logo_thumbs/icons/new-orleans-pelicans.png http://uniformcritics.com/unis/logos/teams/new-york-knicks.png http://l.yimg.com/bt/api/res/1.2/dwwwUT2NG1B6Y.dCr_Z66g--/YXBwaWQ9eW5ld3M7cT04NTt3PTUw/http://l.yimg.com/a/i/us/sp/v/nba/teams/1/50x50c/okc_2.gif http://flapship.com/wp-content/uploads/2012/10/orlando-magic.jpg https://pbs.twimg.com/profile_images/378800000673685337/4e059c7eb40bf99885b2f699545d42ad_normal.png http://flapship.com/wp-content/uploads/2012/10/phoenix-suns.jpg http://pbs.twimg.com/profile_images/1327846836/PortlandTrailBlazers_normal.jpg http://media.247sports.com/Uploads/Assets/553/129/1_1129553.png http://cdn.bleacherreport.net/images/team_logos/50x50/san_antonio_spurs.png http://cache.daylife.com/imageserve/08vA1XLcUl213/50x50.jpg https://pbs.twimg.com/profile_images/1376756596/newjazz_normal.jpg http://cdn.bleacherreport.net/images/team_logos/50x50/washington_wizards.png]
big_logos = %w[http://jbsmooth84.com/wp-content/uploads/2012/10/AHawks.jpg http://nbaschedule2014.com/wp-content/uploads/2013/07/boston-celtics-logo.jpg http://wallapik.com/wp-content/uploads/2013/06/Brooklyn-Nets-Background.jpg http://upload.wikimedia.org/wikipedia/en/1/15/Charlotte_Bobcats_2012.png http://www.sports-logos-screensavers.com/user/Chicago_Bulls2.jpg http://www.fairviewparkchamber.org/cleveland_cavaliers_logo-1024x768.jpg http://no-pedia.com/data_images/dallas-mavericks/dallas-mavericks-02.jpg http://www.sports-logos-screensavers.com/user/Denver_Nuggets.jpg http://3.bp.blogspot.com/-CjzUG14Ly8U/UODQ7ljrxnI/AAAAAAAAbqw/jgbDasr-d-w/s1600/Detroit_Pistons_Logo.jpg http://img.zanda.com/item/75030010000062/1024x768/Golden_State_Warriors_logo.png http://hdwallpaperszon.com/wp-content/uploads/2013/09/Houston-Rockets-Wallpapers-21.jpg http://brooksweekly.files.wordpress.com/2013/04/pacers.gif http://images3.wikia.nocookie.net/__cb20130319134361/uncyclopedia/images/8/82/Los_Angeles_Clippers_logo.jpg https://assets.gavelandgrand.com/779/285/23198/23198-1382735628-Los_Angeles_Lakers.gif http://www.sports-logos-screensavers.com/user/Memphis_Grizzlies.jpg http://www.sports-logos-screensavers.com/user/Miami_Heat3.jpg http://img.zanda.com/item/75010080000019/1024x768/Milwaukee_Bucks_logo.jpg http://blog.betdsi.com/wp-content/uploads/Minnesota-Timberwolves.jpg http://cdn.fansided.com/wp-content/blogs.dir/229/files/2013/01/pelicans.jpg http://www.sports-logos-screensavers.com/user/New_York_Knicks.jpg http://www.bbqsuperstars.com/wp-content/uploads/2013/06/542119.jpg http://www.sports-logos-screensavers.com/user/Orlando_Magic.jpg http://images3.wikia.nocookie.net/__cb20130626115829/nbasports/images/4/49/Philadelphia-76ers-1179.jpg http://www.sports-logos-screensavers.com/user/Phoenix_Suns2.jpg http://www.sports-logos-screensavers.com/user/Portland_Trailblazers.jpg http://www.bubblews.com/assets/images/news/1685968065_1367351110.jpg http://www.sports-logos-screensavers.com/user/San_Antonio_Spurs.jpg http://members.tripod.com/dangerous_danny007/sitebuildercontent/sitebuilderpictures/toronto_raptors.gif http://www.sports-logos-screensavers.com/user/Utah_Jazz.jpg http://www.sportsgeekery.com/wp-content/uploads/2011/11/wizards-wp-5-1920.jpg]
wait
Team.destroy_all
img_counter = 0
  teams.each do |name|
      t = Team.new
      t.name = name
      t.coach = team_coach(t.name)
      t.img_url = team_img_url[img_counter]
      t.large_img_url = big_logos[img_counter]
      wait
      t.save
      wait
      img_counter += 1
end

#CREATING PLAYERS FOR EACH TEAM
wait
Player.destroy_all
counter = 1
teams.each do |team|
  team_players(team).each do |player|
    p = Player.new
    p.number = player['number'].to_s
    p.name = player['name'].to_s
    p.team_id = counter
    p.save
  end
  counter += 1
  wait
end

