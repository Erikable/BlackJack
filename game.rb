class Game

  def initialize
    puts "введите свое имя:"
    @name = gets.strip.capitalize
    money
  end

  #раздать карты

def money
  @diller_money = 100
  @player_money = 100
end

  def start_game
    @bank = 0
    @deck = Deck.new
    @player = Player.new
    @diller = Player.new
    bet
    give_out_cards
  end

  def play_again
    puts "введите (У) что бы продолжить играть "
    tmp = gets.chomp.capitalize
    if tmp == "Y"
      start_game
    else
      exit
    end
  end

  def bet
    @player_money -= 10
    @diller_money -= 10
    @bank += 20
  end

def d
  @player.display_cards
end
  
  def give_out_cards
    @deck.take_card(@player)
    @deck.take_card(@diller)
    @deck.take_card(@player)
    @deck.take_card(@diller)
  end

end