class Player 

    attr_accessor :name, :height, :points, 

    @@all = []
    
    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all
        @@all 
    end 


end 




end 