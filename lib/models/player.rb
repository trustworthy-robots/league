class Player
  def initialize(name, score)
    @name = name
    @score = score.to_i
  end

  attr_reader :name, :score
end
