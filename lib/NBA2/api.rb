require 'pry'
class Api

    def self.display_teams
        url = URI("https://api-nba-v1.p.rapidapi.com/teams/teamId/%7Bteamid%7D")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '4003502385msh5b99a4b71cc0a60p1213e0jsn88f14c03f3be'
        
        response = http.request(request)
        puts response.read_body
        binding.pry 
    end 

    def self.get_team(team)
        key = 
        url = 
        response = HTTParty.get(url)
    end 

    def self.get_player(player)
        key = 
        url = 
        response = HTTParty.get(url)
    end 




end 

