class Cli
    
    # Starts the program and calls on all the methods for the entire app
    
    def start 
        welcome_user
        
        display_team

        pick_team
        
        display_roster

        get_player_attributes

        final_statement
    end 
        
    #Welcomes user to app and calls the Api class method
      
        
    def welcome_user
        puts "🏀🏀Welcome to the NBA app!🏀🏀" 
        puts ""
        puts "Please enter your name"
        name = gets.chomp 
        if name.empty?
          puts ""
          puts "Whattup! Here's a list of the current NBA teams:"
        else
          puts ""
          puts "Whattup #{name}❗️Here's a list of the current NBA teams:⛹ "
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
        puts "Please select the team by their number if you'd like to see their entire roster for the last three seasons. "
        puts ""
        team = gets.chomp.to_i 
        if team > 51  || team <= 0 || !(team.is_a? Integer)   
            puts "This is not valid selection, please pick a team by their corresponding number."
            pick_team
        else  
        Api.get_players(team)
        if Player.all.empty?
            puts "There is currently no information for this team, please pick another."
            pick_team
        end 
        puts "Here is the entire roster."
        puts ""
        end 
    end 

    # This method will display the current roster for whatever team the user chose
    
    def display_roster
        Player.all.each.with_index(1) { |player, index| puts "#{index}. #{player.name} #{player.last_name}"}
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
            get_player_attributes 
        end 
        # The index is at -1 because I display starting at 1
        player = Player.all[index - 1 ]
        unless player.nil? 
        player.print_info
        end 
    end 

    # This method will ask the user whether he/she would like to exit the program or run it again. 

    def final_statement
        puts ""
        puts ""
        puts "🏀🏀Thanks for using the NBA app! If you'd like to run it again press 'Y'. If you'd like to exit type 'N'.🏀🏀"
        input = gets.chomp.capitalize 
        if input != "Y" && input != "N"
            puts "That was not a valid entry."
            final_statement
        elsif input == "Y"
            Team.all.clear 
            Player.all.clear 
            start
        else input == "N"
            exit 
        end 
    end 

end 


