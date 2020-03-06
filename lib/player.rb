class Player < ActiveRecord::Base
    has_many :games

    attr_accessor :x, :y, :rotation

    def draw
        

        @rotation ||= 0
        @x ||= 450
        @y ||= 250
        radians = (@rotation - 90) * Math::PI/180

        x1 = @x
        y1 = @y - 12
        x2 = @x - 7.5
        y2 = @y + 7.5
        x3 = @x + 7.5
        y3 = @y + 7.5

        @x1 = (x1 - @x) * Math.cos(radians) - (y1 - @y) * Math.sin(radians) + @x
        @y1 = (x1 - @x) * Math.sin(radians) + (y1 - @y) * Math.cos(radians) + @y
        @x2 = (x2 - @x) * Math.cos(radians) - (y2 - @y) * Math.sin(radians) + @x
        @y2 = (x2 - @x) * Math.sin(radians) + (y2 - @y) * Math.cos(radians) + @y
        @x3 = (x3 - @x) * Math.cos(radians) - (y3 - @y) * Math.sin(radians) + @x
        @y3 = (x3 - @x) * Math.sin(radians) + (y3 - @y) * Math.cos(radians) + @y

        Triangle.new(x1: @x1, y1: @y1, x2: @x2, y2: @y2, x3: @x3, y3: @y3, z: 50, color: "blue")
    end

    def make_pos
        @x1 = 450
        @y1 = 240
        @x2 = 440
        @y2 = 270
        @x3 = 460
        @y3 = 270
    end

    def rotate(amount = 0)
        @rotation += amount
    end

    def rotate_left
        rotate(3)
    end

    def rotate_right
        rotate(-3)
    end

    def move(direction)
        if direction == "w"
            @y += -Math.sin(@rotation * Math::PI/180)
            @x += -Math.cos(@rotation * Math::PI/180)
        elsif direction == "a"
            rotate_right
        elsif direction == "d"
            rotate_left
        end
    end
    def player_collision?(enemy_array)
        x_origin = (@x1 + @x2 + @x3) / 3
        y_origin = (@y1 + @y2 + @y3) / 3
        enemy_array.any? { |enemy| enemy.x >= (x_origin - 10.7) && enemy.x <= (x_origin + 10.7) && enemy.y >= (y_origin - 5.7) && enemy.y <= (y_origin + 5.7) }
            # calculate player area
            # calculate the enemy area
            # do they intersect?
    end
end