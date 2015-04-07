
require "pry"
class Players
  attr_accessor :player_one

  def user_name
    puts "Please enter your name:"
    @player_one = gets.chomp
  end

end

class Deck < Players
  attr_accessor :player_card, :dealer_card, :deck

  BLACKJACK = 21

  SUITS = ['Heart', 'Diamond', 'Spade', 'Clubs']
  CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
  end

  def calculate_total(cards) #[['heart','2'],['diamond','3']]
    arr = cards.map{ |e| e[1] }
    total = 0
    arr.each do |value|
      if value == "A"
        total += 11
      elsif value.to_i == 0 # J, Q, K
        total += 10
      else
        total += value.to_i # Face Value Cards
      end
    end
    arr.select{|e| e == "A"}.count.times do
      total -= 10 if total > 21
    end
    total
  end

  def print_shuffle_cards
    puts("|S|h|u|f|f|l|i|n|g| |C|a|r|d|s|")
    3.times do
      print ". . . . . . . . . . . . "
      sleep 0.5
    end
    puts ""
  end

  def new_deck
    @deck = SUITS.product(CARDS)
    @deck.shuffle!
  end

  def draw_card
    new_deck.pop
  end

  def player_total
    player_total = calculate_total(@player_card)
  end

end

class Hand < Deck
  def delay
    sleep 1
  end

  def sum_up
    puts "#{player_one}'s cards are #{player_card}, for a total of #{player_total}"
    delay
    puts "The dealer's card is #{dealer_card[0]}"
    puts ""
  end

  def hit_or_stay
    gets.chomp.to_i
  end

  def first_hand
    if player_total == BLACKJACK
      puts "Congratulations, you hit blackjack! You win!"
    else
      puts "#{player_one} would you like to 1) hit or 2) stay"
    end
  end

  def second_hand
    begin
      @player_card << draw_card
      puts "#{player_one}'s cards are #{player_card}, for a total of #{player_total}"
      puts "#{player_one} Would you like to 1) hit or 2) stay"
      hit_or_stay
    end until hit_or_stay == 2 || player_total > BLACKJACK
  end

end

class GameDirectives < Hand

  def kickoff
    begin
      @player_card = []
      @dealer_card = []
      2.times do
        @player_card << draw_card
        @dealer_card << draw_card
      end
      sum_up
      first_hand
      hit_or_stay
    end
    puts "Good bye."
  end

end

class PlayGame < GameDirectives

  def initialize

  end

  def welcome
    puts "+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+"
    puts "|w|e|l|c|o|m|e| |t|o| |b|l|a|c|k|j|a|c|k|"
    puts "+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+-+-+-+-+"
    puts " "
  end

  def game_into
    puts ""
    puts "Welcome to Blackjack #{player_one}. You and the dealer are both dealt two cards to start the game."
  end

  def play
    welcome
    user_name
    game_into
    print_shuffle_cards
    kickoff
  end

end

game = PlayGame.new.play
