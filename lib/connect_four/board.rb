require_relative 'board/position'
require_relative 'board/move_result'
require_relative 'board/direction'

class Board
  HEIGHT = 6
  WIDTH = 7

  attr_reader :cells

  def initialize
    @cells = Array.new(HEIGHT){Array.new(WIDTH)}
  end

  def make_move(piece, column_number)
    col_idx = column_number - 1
    return MoveResult.invalid_column unless (0...WIDTH).include?(col_idx)
    row_idx = next_free_row(col_idx)
    return MoveResult.column_full if row_idx.nil?
    cells[row_idx][col_idx] = piece
    position = Position.new(row_idx, col_idx)

    if winning_move?(position, piece)
      MoveResult.winner(position)
    else
      MoveResult.default(position)
    end
  end

  private

  def piece_at(position)
    @cells[position.row][position.col]
  end

  def next_free_row(col_idx)
    (0...HEIGHT).each do |row_idx|
      return row_idx if cells[row_idx][col_idx].nil?
    end
    return nil
  end

  def winning_move?(position, piece)
    horizontal_win?(position, piece) ||
      vertical_win?(position, piece) ||
      forward_diagonal_win?(position, piece) ||
      backward_diagonal_win?(position, piece)
  end

  def horizontal_win?(position, piece)
    1 + num_contiguous_pieces_in_directions(position, piece, Direction.left, Direction.right) >= 4
  end

  def vertical_win?(position, piece)
    1 + num_contiguous_pieces_in_directions(position, piece, Direction.up, Direction.down) >= 4
  end

  def forward_diagonal_win?(position, piece)
    1 + num_contiguous_pieces_in_directions(position, piece, Direction.up_left, Direction.down_right) >= 4
  end

  def backward_diagonal_win?(position, piece)
    1 + num_contiguous_pieces_in_directions(position, piece, Direction.down_left, Direction.up_right) >= 4
  end

  def num_contiguous_pieces_in_directions(position, piece, *directions)
    contiguous_pieces_count = 0

    directions.each do |direction|
      cursor = position.dup
      loop do
        cursor += direction
        break unless cursor.valid?
        break unless piece_at(cursor) == piece
        contiguous_pieces_count += 1
      end
    end

    contiguous_pieces_count
  end
end
