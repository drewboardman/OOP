require "spec_helper"

module TicTacToe
  describe Array do
    
  	context "all_empty?" do
  		it "should be true if grid contains cells that are all empty" do
  			grid = ["","",""]
  			# board = Board.new(grid: grid)
  			expect(grid.all_empty?).to eq(true)
  		end

  		it "returns false if there are values other than nil or '' in the array" do
  			grid = ["hello", :some_symbol, 12]
  			expect(grid.all_empty?).to eq(false)
  		end

  		it "returns true for an empty array []" do
  			expect([].all_empty?).to eq(true)
  		end
  	end

  	context "#all_same?" do
  		it "returns true for array will identical values" do
  			grid = [1,1,1]
  			expect(grid.all_same?).to eq(true)
  		end

  		it "returns false if array has unique values" do
  			grid = [1, true, 1]
  			expect(grid.all_same?).to eq(false)
  		end

  		it "returns true for an empty array" do
  			expect([].all_same?).to eq(true)
  		end
		end

		context "#any_empty?" do
			it "returns true if there are any empty cells in the array" do
				grid = ["", true, 1]
				expect(grid.any_empty?).to eq(true)
			end

			it "returns false if the array is full of values" do
				grid = [1, "hello", true]
				expect(grid.any_empty?).to eq(false)
			end

			it "returns false if called on an empty array []" do
				expect([].any_empty?).to eq(false)
			end
		end

		context "#none_empty?" do
			it "returns false if there are any empty cells in the array" do
				grid = ["", true, 1]
				expect(grid.none_empty?).to eq(false)
			end

			it "returns true if the array is full of values" do
				grid = [1, "hello", true]
				expect(grid.none_empty?).to eq(true)
			end
		end
  end
end