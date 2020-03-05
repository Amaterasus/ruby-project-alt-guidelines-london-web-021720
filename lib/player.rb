class Player < ActiveRecord::Base
    has_many :games

    attr_accessor :x1, :y1, :x2, :y2, :x3, :y3, :x_movement, :y_movement, :x_flip, :y_flip


    def draw
        Triangle.new(x1: @x1, y1: @y1, x2: @x2, y2: @y2, x3: @x3, y3: @y3, color: "blue")
    end

    def make_pos
        @x1 = 320
        @y1 = 400
        @x2 = 345
        @y2 = 430
        @x3 = 295
        @y3 = 430
        @x_movement = 0
        @y_movement = 5
        @x_flip = true
        @y_flip = true
    end

    def rotate_left
        degrees = 1 * Math::PI/180
        x_origin = (@x1 + @x2 + @x3) / 3
        y_origin = (@y1 + @y2 + @y3) / 3
        @x1 = @x1 * Math.cos(degrees) - @y1 * Math.sin(degrees)
        @y1 = @x1 * Math.sin(degrees) + @y1 * Math.cos(degrees)
        @x2 = @x2 * Math.cos(degrees) - @y2 * Math.sin(degrees)
        @y2 = @x2 * Math.sin(degrees) + @y2 * Math.cos(degrees)
        @x3 = @x3 * Math.cos(degrees) - @y3 * Math.sin(degrees)
        @y3 = @x3 * Math.sin(degrees) + @y3 * Math.cos(degrees)
    end

    def rotate_right
        degrees = -1 * Math::PI/180
        @x1 = @x1 * Math.cos(degrees) - @y1 * Math.sin(degrees)
        @y1 = @x1 * Math.sin(degrees) + @y1 * Math.cos(degrees)
        @x2 = @x2 * Math.cos(degrees) - @y2 * Math.sin(degrees)
        @y2 = @x2 * Math.sin(degrees) + @y2 * Math.cos(degrees)
        @x3 = @x3 * Math.cos(degrees) - @y3 * Math.sin(degrees)
        @y3 = @x3 * Math.sin(degrees) + @y3 * Math.cos(degrees)
    end

    def move(direction)
        if direction == "w"
            @y1 -= @y_movement
            @y2 -= @y_movement
            @y3 -= @y_movement
            @x1 -= @x_movement
            @x2 -= @x_movement
            @x3 -= @x_movement
        elsif direction == "s"
            @y1 += @y_movement
            @y2 += @y_movement
            @y3 += @y_movement
            @x1 += @x_movement
            @x2 += @x_movement
            @x3 += @x_movement
        elsif direction == "a"
            rotate_left
        elsif direction == "d"
            rotate_right
        end
    end
end