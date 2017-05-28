class PlayerDataParser
  PLAYER_PATTERN = %r{
    (?<name>.+?)\s+
    (?<score>\d+)
  }x

  def initialize(player_data)
    @player_data = player_data.strip
  end

  attr_reader :player_data

  def parse
    name, score = self.player_data.match(PLAYER_PATTERN).captures
    Player.new(name, score)
  rescue ArgumentError
    raise Exceptions::IncorrectPlayerData, self.player_data
  end
end
