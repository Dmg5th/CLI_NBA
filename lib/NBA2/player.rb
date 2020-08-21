class Player 

    attr_accessor :name, :last_name, :origin, :height, :dob 

    @@all = []
    # binding.pry 
    
    def initialize(name, last_name, origin, height, dob)
        @name = name 
        @last_name = last_name 
        @origin = origin 
        @height = height
        @dob = dob 
        @@all << self 
         # height = height.to_f/ 0.3048
    end 

    def self.all
        @@all
    end 

    def print_info
       
        if @dob.empty? && @height.empty? && @origin.empty?
            puts "There is currently no additional information for #{@name} #{@last_name}."

        elsif @origin.empty?
            puts "Origin unknown, #{@name} #{@last_name} is #{@height} meters tall, and was born #{@dob}"
       
        elsif @height.empty?
            puts "#{@name} #{@last_name}'s' origin is #{@origin}, and he was born #{@dob}"
      
        elsif @dob.empty?
            puts "#{@name} #{@last_name}'s' origin is #{@origin} and he is #{@height} meters tall."
        
        else 
        puts "#{@name} #{@last_name}'s' origin is #{@origin}, he is #{@height} meters tall, and was born #{@dob}"
    
        end 
    end 
    


end 
