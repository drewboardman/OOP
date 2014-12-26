require_relative "tic_tac_toe/version"

module TicTacToe
end

Dir[File.dirname(__FILE__) + '/tic_tac_toe/*.rb'].each {|file| require file }