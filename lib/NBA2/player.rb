class Player 

    attr_accessor :name, :last_name, :player_id, :origin, :years_pro, :dob 

    @@all = []
    # binding.pry 
    
    def initialize(name, last_name, player_id, origin, years_pro, dob)
        @name = name 
        @last_name = last_name 
        @player_id = player_id 
        @origin = origin 
        @years_pro = years_pro
        @dob = dob 
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def print_info
        if @origin.empty?
            puts "Origin unknown, #{@name} #{last_name} has been in the league for #{years_pro} years, and was born #{@dob}"
       
        elsif @years_pro == "0"
            puts "#{@name} #{last_name}'s country origin is #{@origin}, and was born #{@dob}"

        elsif @dob.empty? 
            puts "#{@name} #{last_name}'s country origin is #{@origin} and has been in the league for #{years_pro} years,"
      
        elsif @dob.empty? && @origin.empty?
            puts "#{@name} #{last_name} has been in the league for #{years_pro} years,"
        
       elsif @origin.empty? && @dob.empty? && @years_pro == 0
            puts "There is currenlty no additional information for #{@name} #{last_name} "
        else 
        puts "#{@name} #{last_name}'s country origin is #{@origin}, was born #{@dob} and has been in the league for #{years_pro} years,"
      end 
    end 
    


end 
