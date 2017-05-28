describe GameDataParser do
  it 'returns list of games' do
    raw_data = [
      'Player_1 3, Player_2 3',
      'Player_3 1, Player_4 0',
      'Player_1 1, Player_4 1'
    ]
    games_list = GameDataParser.new(raw_data).parse

    games_list.must_be_instance_of Array
    games_list[0].must_be_instance_of Game
    games_list[1].must_be_instance_of Game
    games_list[2].must_be_instance_of Game
  end

  it 'raises exception if game data is invalid' do
    raw_data = [
      'Player_1 3, Player_2 3',
      'Player_3 1, 0',
      'Player_1 1, Player_4 1'
    ]

    Proc.new do
      GameDataParser.new(raw_data).parse
    end.must_raise Exceptions::IncorrectGameData
  end
end
