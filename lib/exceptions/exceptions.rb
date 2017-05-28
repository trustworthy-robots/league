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
end
