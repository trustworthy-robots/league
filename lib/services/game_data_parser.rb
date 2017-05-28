class GameDataParser
  def initialize(raw_data)
    @raw_data = raw_data
  end

  attr_reader :raw_data

  def parse
    self.raw_data.map do |game_data|
      begin
        player1, player2 = game_data.split(',').map{ |player_data| PlayerDataParser.new(player_data).parse }
        Game.new(player1, player2)
      rescue
        raise Exceptions::IncorrectGameData, game_data
      end
    end
  end
end
