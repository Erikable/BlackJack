class Game

  def initialize
    print "введите свое имя:  "
    @name = gets.strip.capitalize
    money
    start_game
  end


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
    display_gamers_cards
    menu
  end

  def menu
    puts "выберите действие:"
    puts "1- Взять карту  2- Пропустить ход  3- Открыться  "
    tmp = gets.to_i
    case tmp
      when 1 then player_step
      when 2 then diller_step
      when 3 then def_win
      when 0 then exit
    end
  end

  def display_gamers_cards
    puts
    puts "__________________"
    print "карты #{@name}:  " 
    @player.display_cards
    puts
    puts "__________________"
    print "карты диллера:  "
    @diller.diller_cards
    puts
    puts "__________________"
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
    @player_money -= 10 if @player_money >= 10
    @diller_money -= 10 if @diller_money >= 10
    @bank += 20
  end

def display
  @player.display_cards
end
  
  def give_out_cards
    @deck.take_card(@player)
    @deck.take_card(@diller)
    @deck.take_card(@player)
    @deck.take_card(@diller)
  end

  def player_win?
    if @player.score <= 21 && @player.score > @diller.score
      player_win_bank
    end
  end
  def player_win_bank
    @player_money += @bank
    @bank -= @bank
  end

  def diller_win?
    diller_win_bank if @diller.score <= 21 && @diller.score > @player.score
  end

  def diller_win_bank
    @diller_money += @bank
    @bank -= @bank
  end

  def draw?
    if @player.score == @diller.score && @player.score <= 21 && @diller.score <= 21
      @player_money += 10
      @diller_money += 10
      @bank -= 20
    elsif
      @player.score == @diller.score && @player.score >= 21 && @diller.score >= 21
    end
  end

  def player_step
    @deck.take_card(@player)
    @diller.cards.count == 3 ? def_win : diller_step
  end

  def diller_step
    @deck.take_card(@player)
   # @player.cards.count == 3 ? def_win : player_step
  end

  def def_win
    draw?
    player_win?
    diller_win?
  end

end









