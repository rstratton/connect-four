class Board
  class Position
    attr_accessor :row, :col

    def initialize(row, col)
      @row, @col = row, col
    end

    def valid?
      (0...HEIGHT).include?(row) && (0...WIDTH).include?(col)
    end

    def ==(other)
      row == other.row && col == other.col
    end

    def +(direction)
      Position.new(row + direction.y, col + direction.x)
    end
  end
end
