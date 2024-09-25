class Player
    attr_reader :name, :score

    def initialize(name)
        @name = name
        @score = 0
    end

    def to_s
        "#{@name}"
    end

    def score_up
        @score += 1
    end

end