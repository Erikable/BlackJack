class Card

  def initialize (value, color)
    @value = value
    @color = color
  end

  def display
    "#{@value}#{@color}"
  end

  def value
    if @value.is_a? Integer
      @value
    elsif @value == "A"
      @value = 11
    else
      @value = 10
    end 
  end
end

