class Player < ActiveRecord::Base
    has_many :games

    attr_accessor :x1, :y1, :x2, :y2, :x3, :y3, :x_direction, :y_direction


    def draw
        Triangle.new(x1: @x1, y1: @y1, x2: @x2, y2: @y2, x3: @x3, y3: @y3, color: "blue")
    end

    def make_pos
        @x1 = 450
        @y1 = 240
        @x2 = 440
        @y2 = 270
        @x3 = 460
        @y3 = 270
        @x_direction = 0
        @y_direction = 5
    end

    def rotate_left
        degrees = 3 * Math::PI/180
        x_origin = (@x1 + @x2 + @x3) / 3
        y_origin = (@y1 + @y2 + @y3) / 3
        @x1 = (@x1 - x_origin) * Math.cos(degrees) - (@y1 - y_origin) * Math.sin(degrees) + x_origin
        @y1 = (@x1 - x_origin) * Math.sin(degrees) + (@y1 - y_origin) * Math.cos(degrees) + y_origin
        @x2 = (@x2 - x_origin) * Math.cos(degrees) - (@y2 - y_origin) * Math.sin(degrees) + x_origin
        @y2 = (@x2 - x_origin) * Math.sin(degrees) + (@y2 - y_origin) * Math.cos(degrees) + y_origin
        @x3 = (@x3 - x_origin) * Math.cos(degrees) - (@y3 - y_origin) * Math.sin(degrees) + x_origin
        @y3 = (@x3 - x_origin) * Math.sin(degrees) + (@y3 - y_origin) * Math.cos(degrees) + y_origin

    end

    def rotate_right
        degrees = -3 * Math::PI/180
        x_origin = (@x1 + @x2 + @x3) / 3
        y_origin = (@y1 + @y2 + @y3) / 3
        @x1 = (@x1 - x_origin) * Math.cos(degrees) - (@y1 - y_origin) * Math.sin(degrees) + x_origin
        @y1 = (@x1 - x_origin) * Math.sin(degrees) + (@y1 - y_origin) * Math.cos(degrees) + y_origin
        @x2 = (@x2 - x_origin) * Math.cos(degrees) - (@y2 - y_origin) * Math.sin(degrees) + x_origin
        @y2 = (@x2 - x_origin) * Math.sin(degrees) + (@y2 - y_origin) * Math.cos(degrees) + y_origin
        @x3 = (@x3 - x_origin) * Math.cos(degrees) - (@y3 - y_origin) * Math.sin(degrees) + x_origin
        @y3 = (@x3 - x_origin) * Math.sin(degrees) + (@y3 - y_origin) * Math.cos(degrees) + y_origin
    end

    def move_forward
        x_origin = (@x1 + @x2 + @x3) / 3
        y_origin = (@y1 + @y2 + @y3) / 3
        @x1 - x_origin
    end

    def move_backward

    end

    def move(direction)
        if direction == "w"
            @y1 -= @y_direction
            @y2 -= @y_direction
            @y3 -= @y_direction
            @x1 -= @x_direction
            @x2 -= @x_direction
            @x3 -= @x_direction
        elsif direction == "s"
            @y1 += @y_direction
            @y2 += @y_direction
            @y3 += @y_direction
            @x1 += @x_direction
            @x2 += @x_direction
            @x3 += @x_direction
        elsif direction == "a"
            rotate_right
        elsif direction == "d"
            rotate_left
        end
    end
end