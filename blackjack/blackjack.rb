
class Players
  def player_name
    puts "Please enter your name:"
    gets.chomp
  end

  def dealer
  end

end

class Deck < Players

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

    #correct for aces
    arr.select{|e| e == "A"}.count.times do
      total -= 10 if total > 21
    end

    total
  end

  def shuffle_cards
    puts("|S|h|u|f|f|l|i|n|g| |C|a|r|d|s|")
    3.times do
      print ". . . . . . . . . . . . "
      sleep 0.5
    end
    deck.shuffle!
  end

  def player_cards
    player_cards = []
  end

  def dealer_cards
    dealer_cards = []
  end

  def player_deal_cards
    player_cards << deck.pop
  end

  def dealer_deal_cards
    dealer_cards << deck.pop
  end

  def player_total
    player_total = calculate_total(player_cards)
  end

  def dealer_total
    dealer_total = calculate_total(dealer_cards)
  end

  def sum_up
    puts "#{player_name}'s cards are #{player_cards}, for a total of #{player_total}"
    puts "The dealer's card is #{dealer_cards[0]}"
    puts ""
  end

  def conditionals
    if calculate_total(player_cards) == BLACKJACK
        puts "Congratulations, you hit blackjack! You win!"
      else
        say "#{player_name} would you like to 1) hit or 2) stay"
        hit_or_stay = gets.chomp.to_i

        if hit_or_stay == 1 #hit
          begin
            player_cards << deck.pop
            player_total = calculate_total(player_cards)
            puts "#{player_name}'s cards are #{player_cards}, for a total of #{player_total}"
            puts "#{player_name} Would you like to 1) hit or 2) stay"
            hit_or_stay = gets.chomp.to_i
          end until hit_or_stay == 2 || player_total > BLACKJACK
        end

        if dealer_total < 17
          begin
            dealer_cards << deck.pop
            dealer_total = calculate_total(dealer_cards)
            puts "The dealer takes a card."
            delay
          end until dealer_total >= 17
        end

        puts "Comparing hands..."
        delay
        puts "#{player_name}'s cards are #{player_cards}, for a total of #{player_total}"
        puts "The dealer's cards are #{dealer_cards}, for a total of #{dealer_total}"
        puts ""

        if dealer_total > BLACKJACK
          puts "#{player_name} won!"
        elsif player_total > BLACKJACK || player_total < dealer_total
          puts "House won."
        elsif player_total > dealer_total || dealer_total < BLACKJACK
          puts "#{player_name} won!"
        else
          puts "It's a tie!"
        end
      end # End Player blackjack

      say "#{player_name}, would you like to play again? Y/N"
      play_again = gets.chomp.downcase
  end

end

class GameDirectives < Deck

  def kickoff
    begin
      shuffle_cards
      player_cards
        2.times do
          player_deal_cards
        end
      sum_up
      conditionals
    end until play_again == "n"
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
    player_one = player_name
    puts ""
    puts "Welcome to Blackjack #{player_one}. You and the dealer are both dealt two cards to start the game."
  end

  def play
    welcome
    game_into
    kickoff
  end

end

game = PlayGame.new.play
