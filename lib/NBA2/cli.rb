class Cli
    
    #Welcomes user to app and calls the Api class method
    
    def start
        puts "Welcome to the NBA app!" 
        puts "Please enter your name"
        name = gets.chomp 
        if name.empty?
            puts "Whattup! Here's a list of the current NBA teams:"
        else 
            puts "Whattup #{name}! Here's a list of the current NBA teams: "
        end 
        Api.get_teams 
    end 
        
    # Displays the available teams to get info from by iterating over the Team.all class variable
    
    def display_team 
        Team.all.each.with_index(1) { |team, index| puts "#{index}. #{team.name}"}
    end 

    #
        
    def pick_team 
        team = gets.chomp 
        Api.get_players(team)
        puts "Please pick the team you'd like to select to see their current roster. "
        Player.all.each.with_index(1) { |player, index| puts "#{index}. #{player.name} #{player.last_name}"}
    end 

    def get_player_attributes
        puts "Please select a player by their number to see their current stats."
        index = gets.chomp.to_i 
        puts "Here's that players main attributes:"
        player = Player.all[index - 1 ]
        if player.nil?
            puts "There are currenlty no attributes for this player."
        else
            player.print_info
        end 
    end 

end 


# Player.all.each.with_index(1) { |player, index| puts "#{index}. #{player.height}" }
        # Player.all.each.with_index(1) { |stat, index| puts "#{index}. #{stat.name}"}