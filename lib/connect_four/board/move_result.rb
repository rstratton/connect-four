class Board
  class MoveResult
    attr_reader :position

    def self.invalid_column
      new(invalid_column: true)
    end

    def self.column_full
      new(column_full: true)
    end

    def self.winner(position)
      new(winner: true, position: position)
    end

    def self.default(position)
      new(position: position)
    end

    def initialize(invalid_column: false, column_full: false, winner: false, position: nil)
      @invalid_column = invalid_column
      @column_full = column_full
      @winner = winner
      @position = position
    end

    def invalid_column?
      @invalid_column
    end

    def column_full?
      @column_full
    end

    def winner?
      @winner
    end
  end
end
