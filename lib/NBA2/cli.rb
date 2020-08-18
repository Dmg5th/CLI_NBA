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
        Api.display_teams 
        puts "Please pick the team you'd like to select to see their standings and current roster. "
        team = gets.chomp 
        puts "Great pick! Here's the current standing and roster for the #{team}:"
        puts "Please select a player to see their current stats."
        player = gets.chomp 
        puts "Here's #{player}'s current stats:"
        puts "Thanks for using the NBA app!"
    end 

end 