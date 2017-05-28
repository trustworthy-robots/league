describe Game do
  include Minitest::Hooks

  it 'raises exception if players have the same name' do
    player1 = Player.new('Player_1', 3)
    player2 = Player.new('Player_1', 5)

    Proc.new do
      Game.new(player1, player2)
    end.must_raise Exceptions::PlayersWithSameName
  end

  context 'draw' do
    before do
      @player1 = Player.new('Player_1', 3)
      @player2 = Player.new('Player_2', 3)
    end

    it 'returns true if game result is draw' do
      is_draw = Game.new(@player1, @player2).draw?

      is_draw.must_equal true
    end

    it 'does not return winner if game result is draw' do
      winner = Game.new(@player1, @player2).winner

      assert_nil winner
    end

    it 'does not return loser if game result is draw' do
      loser = Game.new(@player1, @player2).loser

      assert_nil loser
    end
  end

  it 'returns winner' do
    player1 = Player.new('Player_1', 3)
    player2 = Player.new('Player_2', 5)
    winner = Game.new(player1, player2).winner

    winner.must_equal player2
  end


  it 'returns loser' do
    player1 = Player.new('Player_1', 3)
    player2 = Player.new('Player_2', 1)
    loser = Game.new(player1, player2).loser

    loser.must_equal player2
  end
end
