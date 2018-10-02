require_relative 'connect_four/board'
require_relative 'connect_four/board/console_renderer'

class ConnectFour
  def initialize
    @board = Board.new
    @current_player = 'O'
    @next_player = 'X'
  end

  def play
    puts Board::ConsoleRenderer.new(@board).render
    loop do
      column = get_move

      move_result = @board.make_move(@current_player, column)

      if move_result.invalid_column?
        puts "Invalid Column"
        next
      end

      if move_result.column_full?
        puts "Column full"
        next
      end

      puts Board::ConsoleRenderer.new(@board).render
      puts

      if move_result.winner?
        puts "*** WINNER ***"
        break
      end

      swap_players
    end
  end

  def get_move
    s = gets.to_i
  end

  def swap_players
    @current_player, @next_player = @next_player, @current_player
  end
end
