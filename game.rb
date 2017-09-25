class Game
  attr_reader :cards

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
    display_player #@player.display_cards
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

def display_player
  "карты #{@name}: #{@player.display_cards}"
end

def display_diller
  " карты диллера: #{@diller.display_cards}"
end
  
  def give_out_cards
    @deck.take_card(@player)
    @deck.take_card(@diller)
    @deck.take_card(@player)
    @deck.take_card(@diller)
  end

  def player_win?
   # puts
    #display_player
    if @player.score <= 21 && @player.score > @diller.score
      player_win_bank
    elsif 
      @diller.score > 21 && !draw?
      player_win_bank
    end
  end

  def player_win_bank
   # puts "катры диллера были:"
    #display_diller
    @player_money += @bank
    @bank -= @bank
    puts "#{@name} выиграл"
    display_player
    puts "денег y #{@name}: #{@player_money}"
    print "\n катры диллера:"
    display_diller
    puts
    play_again
  end

  def diller_win?
    #puts
   # display_diller
    if @diller.score <= 21 && @diller.score > @player.score
      diller_win_bank 
    elsif 
      @player.score > 21 && !draw?
      diller_win_bank
    end
  end

  def diller_win_bank
    @diller_money += @bank
    @bank -= @bank
    puts "диллер выиграл"
    display_diller
    puts "деньги диллера: #{@diller_money}"
    play_again
  end

  def draw?
    if @player.score == @diller.score && @player.score <= 21 && @diller.score <= 21
      @player_money += 10
      @diller_money += 10
      @bank -= 20
      puts "DrAW"
      play_again
    elsif
      @player.score == @diller.score && @player.score >= 21 && @diller.score >= 21
      puts "d r a w"
      play_again
    end
  end

  def player_step
    @deck.take_card(@player)
    puts
    #display_player
    diller_step
    if @diller.cards.count == 3
      def_win
    else
      diller_step
    end
  end

  def diller_step
    if @diller.score < x[1]
      @deck.take_card(@diller)
    end
    if @player.cards.count == 3
      def_win
    else
      player_step
    end
  end

  def def_win
    draw?
    player_win?
    diller_win?
  end

  def x
    x = [16, 17, 18]
    x.shuffle
  end
end









