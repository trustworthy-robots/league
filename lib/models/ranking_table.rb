class RankingTable < Array
  def initialize
    super()
  end

  def add_points_to_team(team_name, points)
    team = find_team(team_name)
    team[:points] += points
  end

  def result!
    self.sort!{ |t1, t2| [t1[:points], t1[:name]] <=> [t2[:points], t1[:name]] }.reverse!
    update_places_values
  end

  def printable_result
    self.map do |team|
      "#{team[:place]}. #{team[:name]}, #{team[:points]} pts"
    end.join("\n")
  end

  private

  def find_team(team_name)
    self.detect{ |team| team[:name].eql?(team_name) } || init_team(team_name)
  end

  def init_team(team_name)
    self << { name: team_name, points: 0, place: 0 }
    self.last
  end

  def update_places_values
    self.each_with_index{ |team, index| team[:place] = index + 1 }
    equal_teams = self.group_by{ |t| t[:points] }.select{ |_, group| group.size > 1 }

    return self if equal_teams.blank?

    equal_teams = equal_teams.values.flatten
    min_place = equal_teams.map{ |t| t[:place] }.min
    equal_teams = equal_teams.map{ |t| t[:name] }

    self.each do |team|
      next unless team[:name].in?(equal_teams)

      team[:place] = min_place
    end
  end
end
