class Deck

  VALUE = %w[2 3 4 5 6 7 8 9 10 A K Q J]
  COLOR = %w[+ <3 ^ <>]

  attr_accessor :deck

  def initialize
    @deck = []
    COLOR.each do |color|
      VALUE.each do |value|
        @deck << Card.new(value, color)
      end
    end
  end

  def shuffle
    @deck.shuffle!
  end




  def sss
    puts @deck.display
  end

end

