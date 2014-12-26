require 'spec_helper'

module TicTacToe
  describe Board do

	CellTest = Struct.new(:value)
	let(:x_cell) { CellTest.new("X") }
	let(:y_cell) { CellTest.new("Y") }
	let(:empty) { CellTest.new }

    context "#initialize" do
      it "initializes a board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end
    end

    context "#default_grid" do
    	it "creates an empty grid with three rows by default" do
    		board = Board.new
    		expect(board.grid.size).to eq(3)
    	end

    	it "has the correct name" do
    		board = Board.new(grid: "my_grid")
    		expect(board.grid).to eq("my_grid")
    	end

	    it "has three empty elements per row by default" do
	    	board = Board.new
	    	board.grid.each do |row|
	    		expect(row.size).to eq(3)
	    	end
	    end

	  end

	  context "#get_cell" do
	    it "returns the correct value for a given grid coordinate" do
	    	grid = [["","",""],["","","bingo"],["","",""]]
	    	board = Board.new(grid: grid)
	    	expect(board.get_cell(2,1)).to eq("bingo")
	    end
	  end

	  context "#set_cell" do
	  	it "can set the value of a certain cell and have a value attribute associated with it" do
	  		CellTest = Struct.new(:value)
	  		grid = [[CellTest.new("testerino"), "", ""], ["","",""], ["","",""]]
	  		board = Board.new(grid: grid)
	  		board.set_cell(0,0,"bingo")
	  		expect(board.get_cell(0,0).value).to eq("bingo")
	  	end
	  end

	  context "#game_over" do
	  	it "determines :winner if winner? is true" do
	  		board = Board.new
	  		board.stub(:winner?) { true }
	  		expect(board.game_over).to eq(:winner)
	  	end

	  	it "determines :draw if winner? is false and draw? is true" do
	  		board = Board.new
	  		board.stub(:winner?) { false }
	  		board.stub(:draw?) { true }
	  		expect(board.game_over).to eq(:draw)
	  	end

	  	it "determines false if winner? and :draw? are both not true yet" do
	  		board = Board.new
	  		board.stub(:winner?) { false }
	  		board.stub(:draw?) { false }
	  		expect(board.game_over).to eq(false)
	  	end

			it "returns draw if the grid array is full of values and no winning_positions are had" do
	  		grid = [[y_cell, x_cell, y_cell],
	  						[x_cell, y_cell, x_cell],
	  						[x_cell, y_cell, x_cell]]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq(:draw)
			end

			it "returns winner if the grid array is full of values and the row winning_position happens" do
	  		grid = [[y_cell, x_cell, y_cell],
	  						[x_cell, y_cell, x_cell],
	  						[x_cell, x_cell, x_cell]]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq(:winner)
			end

			it "returns winner if the grid array is full of values and the column winning_position happens" do
	  		grid = [[y_cell, x_cell, x_cell],
	  						[x_cell, y_cell, x_cell],
	  						[x_cell, x_cell, x_cell]]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq(:winner)
			end

			it "returns winner if the grid array is full of values and one of the diagonals winning_position happens" do
	  		grid = [[y_cell, x_cell, y_cell],
	  						[x_cell, y_cell, x_cell],
	  						[x_cell, x_cell, y_cell]]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq(:winner)
			end

			it "returns false if the grid array is NOT full of values" do
	  		grid = [[y_cell, x_cell, y_cell],
	  						[x_cell, empty, x_cell],
	  						[x_cell, y_cell, x_cell]]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq(false)
			end
		end

  end
end