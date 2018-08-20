class Board
  class Direction
    attr_reader :x, :y

    def initialize(x, y)
      @x, @y = x, y
    end

    def self.left
      Direction.new(-1, 0)
    end

    def self.right
      Direction.new(1, 0)
    end

    def self.up
      Direction.new(0, 1)
    end

    def self.down
      Direction.new(0, -1)
    end

    def self.up_left
      Direction.new(-1, 1)
    end

    def self.up_right
      Direction.new(1, 1)
    end

    def self.down_left
      Direction.new(-1, -1)
    end

    def self.down_right
      Direction.new(1, -1)
    end
  end
end
