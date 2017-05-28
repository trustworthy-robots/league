module Exceptions
  class BaseException < StandardError
  end

  class IncorrectPlayerData < BaseException
    def initialize(player_data)
      @player_data = player_data
    end

    def message
      "Incorrect player data -- #{@player_data}"
    end
  end

  class PlayersWithSameName < BaseException
    def initialize(player_name)
      @player_name = player_name
    end

    def message
      "Players have the same name -- #{@player_name}"
    end
  end
end
