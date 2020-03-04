class Player < ActiveRecord::Base
    has_many :games

    attr_accessor :x1, :y1, :x2, :y2, :x3, :y3


    def draw
        Triangle.new(x1: @x1, y1: @y1, x2: @x2, y2: @y2, x3: @x3, y3: @y3, color: "blue")
    end

    def make_pos
        @x1 = 320
        @y1 = 300
        @x2 = 415
        @y2 = 430
        @x3 = 225
        @y3 = 430
    end

    def move(direction)
        if direction == "w"
            @y1 -= 5
            @y2 -= 5
            @y3 -= 5
        elsif direction == "s"
            @y1 += 5
            @y2 += 5
            @y3 += 5
        elsif direction == "a"

        elsif direction == "d"

        end
    end
end