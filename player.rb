class Player

  attr_reader :deck, :cards

  def initialize
    @cards = []

  end

  def count_score
    score = 0

  end

  def display_cards
    @cards.each {|card| print "#{card.display}  "}
  end

end