class Cli

    def start
        puts "Welcome to the NBA app!" 
        puts "Please enter your name"
        name = gets.chomp 
        if name.empty?
            puts "Whattup! Here's a list of the current NBA teams:"
        else 
            puts "Whattup #{name}! Here's a list of the current NBA teams:"
        end 
        Api.get_teams 
        Team.all.each.with_index(1) { |team, index| puts "#{index}. #{team.name}"}
        puts "Please pick the team you'd like to select to see their standings and current roster. "
        team = gets.chomp 
        puts "Great pick! Here's the current standing and roster for that team:"
        Api.get_players(team)
        Player.all.each.with_index(1) { |player, index| puts "#{index}. #{player.name} #{player.last_name}"}
        puts "Please select a player to see their current stats."
        player = gets.chomp 
        puts "Here's #{player}'s current stats:"
        puts "Thanks for using the NBA app!"
    end 

end 