class Cli
    
    # Starts the program and calls on all the methods for the entire app
    
    def start 
        self.welcome_user
        
        self.display_team

        while Player.all.empty?
        puts "There is currently no information for this team, please pick another."

        self.pick_team
        end 

        self.get_player_attributes

        self.final_statement
    end 
        
    #Welcomes user to app and calls the Api class method
      
        
    def welcome_user
        puts "Welcome to the NBA app!" 
        puts ""
        puts "Please enter your name"
        name = gets.chomp 
        if name.empty?
          puts ""
          puts "Whattup! Here's a list of the current NBA teams:"
        else
          puts ""
          puts "Whattup #{name}! Here's a list of the current NBA teams: "
          puts ""
        end 
        Api.get_teams 
    end 
        
    # Displays the available teams to get info from by iterating over the Team.all class variable
    
    def display_team 
        Team.all.each.with_index(1) { |team, index| puts "#{index}. #{team.name}"}
    end 

    # This method allows the user to pick a team of their choice. 
        
    def pick_team 
        team = gets.chomp.to_i 
        if team > 51  || team <= 0 || !(team.is_a? Integer)   
            puts "This is not valid selection, please pick a team by their corresponding number."
        else  
        Api.get_players(team)
        puts "Please pick the team you'd like to select to see their current roster. "
        Player.all.each.with_index(1) { |player, index| puts "#{index}. #{player.name} #{player.last_name}"}
        puts ""
        puts "Great pick! Above is the current roster for that team."
        end 
    end 

    def get_player_attributes
        puts "Please select a player by their number to see their current stats."
        puts ""
        index = gets.chomp.to_i 
        puts ""
        puts "Here's that players main attributes:"
        puts ""
        player = Player.all[index - 1 ]
        if player.nil?
            puts "There are currently no attributes for this player."
        else
            player.print_info
        end 
    end 

    def final_statement
        puts ""
        puts ""
        puts "Thanks for using the NBA app! The program will run again if you'd like to keep going!"
        puts ""
        puts ""
        self.start 
    end 

end 


