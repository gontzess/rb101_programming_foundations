# twenty-one game

CARD_SUITS = %w(Hearts Diamonds Clubs Spades)
CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [11, 1]]
CARDS = (1..52).each_with_object({}) do |card_id, hash|
  hash[card_id] = { name: CARD_NAMES[(card_id % 13) - 1],
                    value: CARD_VALUES[(card_id % 13) - 1],
                    suit: CARD_SUITS[(card_id - 1) / 13] }
end
CARD_LIMIT = 21
ROUNDS_TO_WIN = 3

## METHOD DEFINITIONS
def clear_screen
  (system 'clear') || (system 'cls')
end

def prompt(msg1, msg2='', msg3='')
  if msg3 == '' && msg2 == ''
    puts "=> #{msg1}"
  elsif msg3 == '' && msg2 != ''
    puts "=> #{msg1} #{msg2}"
  elsif msg3.start_with?('-')
    msg3 = msg3.reverse.chop.reverse
    puts "=> #{msg1} #{msg2}#{msg3}"
  else
    puts "=> #{msg1} #{msg2} #{msg3}"
  end
end

def joinor(ary, divider=', ', ending='and')
  case ary.length
  when 0 then ''
  when 1 then ary.first.to_s
  when 2 then ary.join(" #{ending} ")
  else
    ary[0..-2].join(divider) + "#{divider}#{ending} #{ary.last}"
  end
end

def initialize_deck
  (1..52).to_a.shuffle
end

def initialize_table
  { Player: [], Dealer: [], deck: initialize_deck,
    total: { Player: 0, Dealer: 0 } }
end

def initialize_scoreboard
  { round: 1,
    game_score: { Player: 0, Dealer: 0 },
    game_complete: false,
    game_winner: nil }
end

def update_totals!(table)
  table[:total] = { Player: smart_sum_of_hand(table, 'Player'),
                    Dealer: smart_sum_of_hand(table, 'Dealer') }
  nil
end

def update_round_results!(scoreboard, round_winner)
  return nil unless %w(Player Dealer tie).include?(round_winner)

  scoreboard[:round] += 1

  if round_winner != 'tie' # i.e. Player or Dealer won
    scoreboard[:game_score][round_winner.to_sym] += 1

    if scoreboard[:game_score][round_winner.to_sym] >= ROUNDS_TO_WIN
      scoreboard[:game_complete] = true
      scoreboard[:game_winner] = round_winner
    end
  end
end

def busted?(sum)
  sum > CARD_LIMIT
end

def player_busted?(table, player)
  busted?(table[:total][player.to_sym])
end

def raw_sum_of_hand(table, player)
  aces = 0
  raw_sum = if table[player.to_sym].empty?
              0
            else
              table[player.to_sym].inject(0) do |total, card_idx|
                if CARDS[card_idx][:name] == 'Ace'
                  aces += 1
                  total + CARDS[card_idx][:value][0]
                else
                  total + CARDS[card_idx][:value]
                end
              end
            end
  return raw_sum, aces
end

def smart_sum_of_hand(table, player)
  raw_sum, aces = raw_sum_of_hand(table, player)

  loop do
    return raw_sum if aces == 0 || !busted?(raw_sum)

    raw_sum -= 10
    aces -= 1
  end
end

def deal_first_round!(table)
  2.times do
    table[:Player] << table[:deck].shift
    table[:Dealer] << table[:deck].shift
  end
  update_totals!(table)
end

def convert_card_ids(ary_card_ids, output_key)
  # accepts output_key = 'name', 'value', or 'suit'
  return nil unless %w(name value suit).include?(output_key)

  ary_card_ids.each_with_object([]) do |card_id, converted|
    converted << CARDS[card_id][output_key.to_sym]
  end
end

def display_table(table, player='both')
  # accepts player = 'both', 'Player', or 'Dealer'round_winner
  dealer_cards = ['unknown card'] +
                 convert_card_ids(table[:Dealer][1..-1], 'name')
  player_cards = convert_card_ids(table[:Player], 'name')

  case player
  when 'both'
    prompt('Dealer has:', joinor(dealer_cards))
    prompt('You have:', joinor(player_cards))
  when 'Player'
    prompt('You have:', joinor(player_cards))
  when 'Dealer'
    prompt('Dealer has:', joinor(dealer_cards))
  else
    prompt('ERROR')
  end
end

def hit!(table, player)
  table[player.to_sym] << table[:deck].shift
  nil
end

def dealer_hit?(table)
  return false if player_busted?(table, 'Player')

  table[:total][:Dealer] < table[:total][:Player]
end

def player_turn!(table)
  puts ''
  prompt("Your turn...")
  loop do
    answer = ''
    prompt("Hit or stay? (h/s)")

    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)
      prompt("That's not a valid choice.")
    end

    if answer == 's'
      prompt("You stayed at #{table[:total][:Player]}.")
      break
    end

    hit!(table, 'Player')
    update_totals!(table)
    display_table(table, 'Player')

    break if player_busted?(table, 'Player')
  end
end

def dealer_turn!(table)
  puts ''
  prompt("Dealer turn...")

  loop do
    if dealer_hit?(table)
      hit!(table, 'Dealer')
      update_totals!(table)
      prompt("Dealer hits!")
      display_table(table, 'Dealer')
    else
      prompt("Dealer stays at #{table[:total][:Dealer]}.")
      break
    end

    break if player_busted?(table, 'Dealer')
  end
end

def determine_winning_hand(table)
  result = table[:total][:Player] <=> table[:total][:Dealer]

  case result
  when -1 then 'Dealer'
  when 1  then 'Player'
  when 0  then 'tie'
  else         'ERROR'
  end
end

def display_game_start
  clear_screen
  prompt("Welcome to the game!")
  prompt("You will be playing against the Dealer.")
  prompt("Get as close to #{CARD_LIMIT} as possible, without going over.")
  prompt("First to #{ROUNDS_TO_WIN} wins the game.")
  puts ''
  prompt("Ready? Press enter to begin.")
  gets.chomp
  clear_screen
end

def display_game_end
  prompt("Press enter to exit.")
  gets.chomp
  prompt("Goodbye!")
  sleep 3
  clear_screen
end

def display_round_num(scoreboard)
  scoreboard[:round]
end

def display_round_results(table, round_winner, busted)
  puts ''
  if round_winner == 'Player'
    if busted
      prompt("The dealer busts at #{table[:total][:Dealer]}.. you win.")
    else
      prompt("You win.. this time..")
    end
  elsif round_winner == 'Dealer'
    if busted
      prompt("YA BUSTED at #{table[:total][:Player]}. Dealer wins!")
    else
      prompt("YOU LOSE. Dealer wins!")
    end
  else
    prompt("It's a tie.")
  end
end

def game_score(scoreboard)
  score = []
  scoreboard[:game_score].each do |player, wins|
    name = player == :Player ? 'You' : player
    score << "#{name}: #{wins}"
  end
  score.join(', ')
end

def display_game_score(scoreboard)
  puts ''
  prompt("The score is #{game_score(scoreboard)}")
end

def determine_game_winner(scoreboard)
  scoreboard[:game_winner]
end

def game_won?(scoreboard)
  !!determine_game_winner(scoreboard)
end

def display_game_results(game_winner)
  if game_winner == 'Player'
    prompt("Congratulations, you won the game.. beginner's luck..")
  else
    prompt("Remember, Dealer always wins!")
  end
end

def play_again?
  answer = ''
  loop do
    prompt("Another round? (y/n)")
    answer = gets.chomp.downcase
    break if %w(y n).include?(answer)
    prompt("That's not a valid choice.")
  end
  answer == 'y'
end

## MAIN PROGRAM
display_game_start
scoreboard = initialize_scoreboard

loop do
  display_round_num(scoreboard)
  table = initialize_table
  deal_first_round!(table)
  display_table(table)

  player_turn!(table)

  if player_busted?(table, 'Player')
    busted = true
    round_winner = 'Dealer'
  else
    dealer_turn!(table)

    if player_busted?(table, 'Dealer')
      busted = true
      round_winner = 'Player'
    else
      busted = false
      round_winner = determine_winning_hand(table)
    end
  end

  display_round_results(table, round_winner, busted)
  update_round_results!(scoreboard, round_winner)
  display_game_score(scoreboard)

  break if game_won?(scoreboard) || !play_again?
  clear_screen
end

if game_won?(scoreboard)
  game_winner = determine_game_winner(scoreboard)
  display_game_results(game_winner)
end

display_game_end
