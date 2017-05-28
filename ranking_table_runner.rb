require './environment'

games_data = InputFileReader.new.lines
ranking_table = RankingTableBuilder.new(games_data).build

puts ranking_table.printable_result
