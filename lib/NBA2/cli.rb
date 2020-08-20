class Cli
    
    # Starts the program and calls on all the methods for the entire app
    
    def start 
        self.welcome_user
        
        self.display_team

        self.pick_team
        
        self.display_roster

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
            self.pick_team
        else  
        Api.get_players(team)
        if Player.all.empty?
            puts "There is currently no information for this team, please pick another."
            self.pick_team
        end 
        puts "Please select the team by their number you'd to see their current roster. "
        end 
    end 

    # This method will display the current roster for whatever team the user chose
    
    def display_roster
        Player.all.each.with_index(1) { |player, index| puts "#{index}. #{player.name} #{player.last_name}"}
        puts ""
        puts "Above is the entire roster for that team."
    end 

    # This method will prompt the user to select a player by their corresponding number, and then reveal that players attributes after he is chosen. 

    def get_player_attributes
        puts "Please select a player by their number to see their current stats."
        puts ""
        index = gets.chomp.to_i 
        puts ""
        puts "Here's that players main attributes:"
        puts ""
        if index > Player.all.length || index <= 0 || !(index.is_a? Integer)   
            puts "This is not valid selection, please pick a player by their corresponding number."
            self.get_player_attributes 
        end 
        # The index is at -1 because I display it at 1
        player = Player.all[index - 1 ]
        unless player.nil? 
        player.print_info
        end 
    end 

    # This method will ask the user whether he/she would like to exit the program or run it again. 

    def final_statement
        puts ""
        puts ""
        puts "Thanks for using the NBA app! If you'd like to run it again press 'Y'. If you'd like to exit type 'N'."
        input = gets.chomp.capitalize 
        if input != "Y" && input != "N"
            puts "That was not a valid entry."
            self.final_statement
        elsif input == "Y"
            Team.all.clear 
            Player.all.clear 
            self.start
        else input == "N"
            exit 
        end 
    end 

end 


