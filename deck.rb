class Deck

  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "K", "Q", "J"]
  COLOR = %w[♠ ♥ ♦ ♣]

  attr_accessor :deck

  def initialize
    @deck = []
    COLOR.each do |color|
      VALUE.each do |value|
        @deck << Card.new(value, color)
      end
    end
    shuffle
  end

  def take_card(player)
    player.cards << @deck.slice!(-1)
    #@deck.pop  # stack level too deep
  end

  def shuffle
    @deck.shuffle!
  end

end

