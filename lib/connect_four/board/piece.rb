class Board
  class Piece
    attr_reader :token

    def initialize(token)
      @token = token
    end

    def ==(other)
      token == other.token
    end
  end
end
