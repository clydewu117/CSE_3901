class Card

    attr_reader :number, :shape, :shading, :color

    def initialize(number, shape, shading, color)
        @number = number
        @shape = shape
        @shading = shading
        @color = color
    end

    def show_card
        puts @number
        puts @shape
        puts @shading
        puts @color
        puts
    end

end
