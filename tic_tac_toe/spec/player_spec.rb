require "spec_helper"

module TicTacToe
  describe Player do
    context "#initialize" do

      it "raises an exception when initialized with empy hash {}" do
        expect {Player.new({})}.to raise_error
      end

      it "doesn't raise an error with valid hash input" do
        input = { color: "X", name: "Somebody" }
        expect {Player.new(input)}.to_not raise_error
      end

    end

    context "#color" do

      it "returns the player color" do
        input = { color: "X", name: "Somebody"}
        player = Player.new(input)
        expect(player.color).to eq "X"
      end

    end

    context "#name" do

      it "returns the player name" do
        input = {color: "X", name: "Somebody"}
        player = Player.new(input)
        expect(player.name).to eq "Somebody"
      end

    end
  end
end