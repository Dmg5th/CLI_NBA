class Player 

    attr_accessor :name, :last_name, :height, :points

    @@all = []
    # binding.pry 
    
    def initialize(name, last_name)
        @name = name 
        @last_name = last_name 
        @@all << self 
    end 

    def self.all
        @@all 
    end 


end 
