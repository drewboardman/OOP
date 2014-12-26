module TicTacToe
  class Player
  attr_reader :color, :name
    def initialize(args)
      @color = args.fetch(:color)
      @name = args.fetch(:name)
    end
  end
end