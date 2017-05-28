describe PlayerDataParser do
  it 'returns player' do
    result = PlayerDataParser.new('Player_1 3').parse
    result.must_be_instance_of Player
  end

  it 'parses player data' do
    player_data = 'Player_1 3'
    player = PlayerDataParser.new(player_data).parse

    player.name.must_equal 'Player_1'
    player.score.must_equal 3
  end

  it 'removes leading/trailing whitespaces before parsing' do
    raw_data = '      Player_1 3      '
    expected = 'Player_1 3'
    PlayerDataParser.new(raw_data).player_data.must_equal expected
  end

  it 'raises exception if data is incorrect' do
    Proc.new do
      PlayerDataParser.new('3 Player_1').parse
    end.must_raise Exceptions::IncorrectPlayerData
  end
end
