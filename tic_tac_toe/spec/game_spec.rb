require "spec_helper"

module TicTacToe
  describe Game do
 
    let (:bob) { Player.new({color: "X", name: "bob"}) }
    let (:frank) { Player.new({color: "O", name: "frank"}) }
 
    context "#initialize" do
      it "randomly selects a current_player" do
        players = [bob, frank]
        players.stub(:shuffle) { [frank, bob] }
        game = Game.new(players)
        expect(game.current_player).to eq(frank)
      end

      it "randomly select an other_player" do
      	players = [bob, frank]
      	players.stub(:shuffle) { [frank, bob] }
      	game = Game.new(players)
      	expect(game.other_player).to eq(bob)
      end
    end

    context '#switch_players' do
    	it "returns the current_player opposite that from the constructor" do
    		players = [bob, frank]
    		game = Game.new(players)
    		other_player = game.other_player
    		game.switch_players
    		expect(game.current_player).to eq(other_player)
    	end

    	it "returns other_player opposite to that of the constructor" do
    		players = [bob, frank]
    		game = Game.new(players)
    		current_player = game.current_player
    		game.switch_players
    		expect(game.other_player).to eq(current_player)
    	end
    end

    context '#solicit_move' do
    	it "asks the player to move with the correct name" do
    		players = [bob, frank]
    		players.stub(:shuffle) { [frank, bob] }
    		game = Game.new(players)
    		message = "frank: Please enter a number between 1-9 that represents a position on the grid"
    		expect(game.solicit_move).to eq(message)
    	end
    end

    context '@game_over_message' do
    	it "correctly displays a win message with current_player.name" do
    		players = [bob, frank]
    		game = Game.new(players)
    		game.board.stub(:game_over) {:winner}
    		game.stub(:current_player) {bob}
    		expect(game.game_over_message).to eq("bob won!")
    	end

    	it "correctly displays a tie message" do
    		players = [bob, frank]
    		game = Game.new(players)
    		game.board.stub(:game_over) {:draw}
    		expect(game.game_over_message).to eq("Tie")
    	end
    end

    context '#get_move' do
    	it "converts move of '1' to [0,0] on the grid" do
    		players = [bob, frank]
    		game = Game.new(players)
    		expect(game.get_move('1')).to eq([0,0])
    	end

    	it "converts move of '6' to [2,1] on the grid" do
    		players = [bob, frank]
    		game = Game.new(players)
    		expect(game.get_move('6')).to eq([2,1])
    	end
    end
  end
end