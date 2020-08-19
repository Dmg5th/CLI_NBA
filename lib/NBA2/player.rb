class Player 

    attr_accessor :name, :last_name, :player_id, :origin, :height, :dob 

    @@all = []
    # binding.pry 
    
    def initialize(name, last_name, player_id, origin, height, dob)
        @name = name 
        @last_name = last_name 
        @player_id = player_id 
        @origin = origin 
        @height = height 
        @dob = dob 
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def print_info
        if @origin.empty?
            puts "Origin unknown, #{@name} #{last_name} is #{@height} meters tall, and was born #{@dob}"
       
        elsif @height.empty?
            puts "#{@name} #{last_name} is from #{@origin}, and was born #{@dob}"
      
        elsif @dob.empty?
            puts "#{@name} #{last_name} is from #{@origin} and is #{@height} meters tall."
        
        else 
        puts "#{@name} #{last_name} is from #{@origin} and is #{@height} meters tall, and was born #{@dob}"
        # puts "#{@player_id}"
        end 
    end 
    


end 
