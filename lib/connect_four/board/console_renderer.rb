class Board
  class ConsoleRenderer
    def initialize(board)
      @board = board
    end

    def render
      result = draw_row_separator
      @board.cells.reverse.each do |row|
        result << draw_row(row)
        result << draw_row_separator
      end
      result << draw_labels
      result
    end

    private

    def draw_row_separator
      (['+'] * (WIDTH + 1)).join('---') + "\n"
    end

    def draw_labels
      '  1   2   3   4   5   6   7  '
    end

    def draw_row(row)
      result = '|'
      row.each do |piece|
        result << " #{piece.nil? ? ' ' : piece} |"
      end
      result << "\n"
      result
    end
  end
end
