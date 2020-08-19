require 'pry'
class Api

    def self.get_teams
        url = URI("https://api-nba-v1.p.rapidapi.com/teams/league/standard")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '4003502385msh5b99a4b71cc0a60p1213e0jsn88f14c03f3be'
        
        response = http.request(request)
    
        hash = JSON.parse response.read_body()
    
        hash["api"]["teams"].each { |team| Team.new(team["fullName"]) unless team["fullName"].empty? }
    end 

    def self.get_players(team)
        url = URI("https://api-nba-v1.p.rapidapi.com/players/teamId/#{team}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '4003502385msh5b99a4b71cc0a60p1213e0jsn88f14c03f3be'

        response = http.request(request)
        
        hash = JSON.parse response.read_body()
        hash["api"]["players"].each do |player| 
        Player.new(player["firstName"], player["lastName"], player["playerId"], player["country"], player["heightInMeters"], player["dateOfBirth"])  
        end 
        # binding.pry               
       
    end 

    

   
    # def self.get_stats(player)
        
    #     url = URI("https://api-nba-v1.p.rapidapi.com/statistics/players/playerId/#{player.player_id}")

    #     http = Net::HTTP.new(url.host, url.port)
    #     http.use_ssl = true
    #     http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #     request = Net::HTTP::Get.new(url)
    #     request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    #     request["x-rapidapi-key"] = '4003502385msh5b99a4b71cc0a60p1213e0jsn88f14c03f3be'

    #     response = http.request(request)
    #     hash = JSON.parse response.read_body()
    #     # binding.pry 
    #     puts hash
    #     hash["api"]["statistics"].each { |stat| print " Points: #{stat["points"] }" } 
       
    # end 



end 

