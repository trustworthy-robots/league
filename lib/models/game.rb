class Game
  def initialize(player1, player2)
    raise Exceptions::PlayersWithSameName, player1.name if player1.name == player2.name

    @player1 = player1
    @player2 = player2
  end

  attr_reader :player1, :player2

  def draw?
    self.player1.score == self.player2.score
  end

  def winner
    return nil if self.draw?

    (self.player1.score > self.player2.score) ? self.player1 : self.player2
  end

  def loser
    return nil if self.draw?

    (self.player1.score < self.player2.score) ? self.player1 : self.player2
  end
end
