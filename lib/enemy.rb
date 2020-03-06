class Enemy

    attr_accessor :x, :y, :x_movement, :y_movement

    def initialize
        @x = (0..900).to_a.sample
        @y = (0..500).to_a.sample
        @x_movement = [-2, -1.5 -1, 1, 1.5, 2].sample
        @y_movement = [-2, -1.5 -1, 1, 1.5, 2].sample
        
    end

    def draw
        Circle.new(x: x, y: y, radius: 5, sectors: 32, color: 'purple', z: 50)
    end

    def move
        if @x <= 0 || @x >= 900
            @x_movement = -@x_movement
        end
        if @y <= 0 || @y >= 500
            @y_movement = -@y_movement
        end

        @x += x_movement
        @y += y_movement
    end

    def detect_enemy_collision
        if @x || @y
            return false
        end

    end

end