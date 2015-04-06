
require "pry"
class Players

  attr_accessor :player_one

  def user_name
    puts "Please enter your name:"
    @player_one = gets.chomp
  end

  def dealer
  end

end

class Deck < Players
  attr_accessor :player_card, :deck

  BLACKJACK = 21

  SUITS = ['Heart', 'Diamond', 'Spade', 'Clubs']
  CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize
  end

  def deck
    deck = SUITS.product(CARDS)
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

  def delay
    sleep 1
  end

  def new_deck
    @deck = SUITS.product(CARDS)
    @deck.shuffle!
  end

  def player_total
    player_total = calculate_total(@player_card)
  end

  def sum_up
    puts "#{@player_one}'s cards are #{@player_card}, for a total of #{player_total}"
    delay
    puts "The dealer's card is "#{dealer_cards[0]}
    puts ""
  end

end

class GameDirectives < Deck

  def kickoff
    begin
      @player_card = []
      2.times do
        @player_card << new_deck.pop
      end
      sum_up
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
