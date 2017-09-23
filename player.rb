class Player

  attr_reader :deck, :cards

  def initialize
    @cards = []

  end

  def score
    score = 0
    @cards.each do |card|
      score += card.value
    end
  end

  def display_cards
    @cards.each {|card| print "#{card.display}  "}
  end

end