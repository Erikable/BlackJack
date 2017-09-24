class Player

  attr_accessor :deck, :cards

  def initialize
    @cards = []
  end

  def score
    score = 0
    @cards.each do |card|
      score += card.value
    end
    score
  end

  def display_cards
    @cards.each {|card| print "#{card.display}  "}
  end

  def diller_cards
    @cards.count.times {print '*  '}
  end

end