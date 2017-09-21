class Card

  def initialize (value, color)
    @value = value
    @color = color
  end

  def display
    "#{@value}#{@color}"
  end

end