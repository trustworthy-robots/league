class RankingTableBuilder
  POINTS_MAP = {
    win: 3,
    draw: 1,
    lose: 0
  }.freeze

  def initialize(game_data)
    @game_data = game_data
    @ranking_table = RankingTable.new
  end

  attr_reader :game_data

  def build
    GameDataParser.new(self.game_data).parse.each do |game|
      if game.draw?
        @ranking_table.add_points_to_team(game.player1.name, POINTS_MAP[:draw])
        @ranking_table.add_points_to_team(game.player2.name, POINTS_MAP[:draw])
      else
        @ranking_table.add_points_to_team(game.winner.name, POINTS_MAP[:win])
        @ranking_table.add_points_to_team(game.loser.name, POINTS_MAP[:lose])
      end
    end

    @ranking_table.result!
  end
end
