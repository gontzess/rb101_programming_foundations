# twenty-one game

# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

CARD_SUITS = %w(Hearts Diamonds Clubs Spades)
CARD_NAMES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, [11, 1]]
CARDS = (1..52).each_with_object({}) do |card_id, hash|
          hash[card_id] = { name: CARD_NAMES[(card_id % 13) - 1],
                             value: CARD_VALUES[(card_id % 13) - 1],
                             suit: CARD_SUITS[(card_id - 1) / 13] }
        end
ROUNDS_TO_WIN = 3
# NUMBER_OF_PLAYERS = 2

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
  { Player: [], Dealer:[], deck: initialize_deck }
end

def initialize_scoreboard
  { round_score: { Player: 0, Dealer: 0 },
    round: 1,
    game_score: { Player: 0, Dealer: 0 },
    game_complete: false,
    game_winner: '' }
end

def reset_round_score!(scoreboard)
  scoreboard[:round_score] = { Player: 0, Dealer: 0 }
end

def update_round_score!(table, scoreboard)
  scoreboard[:round_score] = { Player: smart_sum_of_hand(table, 'Player'),
                               Dealer: smart_sum_of_hand(table, 'Dealer') }
end

def update_round_results!(scoreboard, round_winner)
  return nil unless %w(Player Dealer tie).include?(round_winner)

  if round_winner == 'tie'
    scoreboard[:round] += 1
  else  # i.e. Player or Dealer won
    scoreboard[:round] += 1
    scoreboard[:game_score][round_winner.to_sym] += 1

    if scoreboard[:game_score][round_winner.to_sym] >= ROUNDS_TO_WIN
      scoreboard[:game_complete] = true
      scoreboard[:game_winner] = round_winner
    end
  end

  reset_round_score!(scoreboard)
end

def bust?(sum)
  sum > 21
end

def player_bust?(scoreboard, player)  ## CONSOLIDATE
  scoreboard[:round_score][player.to_sym] > 21
end

def raw_sum_of_hand(table, player)
  aces = 0
  raw_sum = if table[player.to_sym].empty?
              0
            else
              table[player.to_sym].inject(0) do |total, card_idx|
                if CARDS[card_idx][:name] == 'Ace'
                  aces +=1
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
    return raw_sum if aces == 0 || !bust?(raw_sum)

    raw_sum -= 10
    aces -= 1
  end
end

# def determine_round_winner_OLD(scoreboard)
#   winner = scoreboard[:round_score].keys.max_by do |player|
#              scoreboard[:round_score][player]
#            end
#   winner.to_s
# end

def determine_round_winner(scoreboard)
  result = scoreboard[:round_score][:Player] <=>
           scoreboard[:round_score][:Dealer]
  case result
  when -1 then 'Dealer'
  when 1  then 'Player'
  when 0  then 'tie'
  else         'ERROR'
  end
end

def deal_first_round!(table, scoreboard)
  2.times do
    table[:Player] << table[:deck].shift
    table[:Dealer] << table[:deck].shift
  end
  update_round_score!(table, scoreboard)
end

def convert_card_ids(ary_card_ids, output_key)  # accepts output_key = 'name', 'value', or 'suit'
  return nil unless %w(name value suit).include?(output_key)

  ary_card_ids.each_with_object([]) do |card_id, converted|
    converted << CARDS[card_id][output_key.to_sym]
  end
end

def display_table(table, player='both')  # accepts player = 'both', 'Player', or 'Dealer'
  dealer_cards = ['unknown card'] + convert_card_ids(table[:Dealer][1..-1], 'name')
  player_cards = convert_card_ids(table[:Player], 'name')

  case player
  when 'both'
    prompt('Dealer has:', joinor(dealer_cards))
    # prompt('pssstt.. secret card is:', convert_card_ids(table[:Dealer], 'name').first)  # remove later
    p smart_sum_of_hand(table, 'Dealer')  # remove later
    prompt('You have:', joinor(player_cards))
    p smart_sum_of_hand(table, 'Player')  # remove later
  when 'Player'
    prompt('You have:', joinor(player_cards))
    p smart_sum_of_hand(table, 'Player')  # remove later
  when 'Dealer'
    prompt('Dealer has:', joinor(dealer_cards))
    p smart_sum_of_hand(table, 'Dealer')  # remove later
  else
    prompt('ERROR')
  end
end

def hit!(table, player)
  table[player.to_sym] << table[:deck].shift
  return nil
end

def computer_hit?(scoreboard)
  scoreboard[:round_score][:Dealer] < 17
end

def player_turn!(table, scoreboard)
  loop do
    answer = ''
    prompt('Your turn: hit or stay? (h/s)')

    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include?(answer)
      prompt("That's not a valid choice.")
    end

    break if answer == 's'

    hit!(table, 'Player')
    update_round_score!(table, scoreboard)
    display_table(table, 'Player')

    break if player_bust?(scoreboard, 'Player')
  end
end

def dealer_turn!(table, scoreboard)
  loop do
    if computer_hit?(scoreboard)
      hit!(table, 'Dealer')
      update_round_score!(table, scoreboard)
      prompt('Dealer hits!')
      display_table(table, 'Dealer')
    else
      prompt('Dealer stays!')
      break
    end
    break if player_bust?(scoreboard, 'Dealer')
  end
end

def play_again?
  answer = ''
  loop do
    prompt('Another round? (y/n)')
    answer = gets.chomp.downcase
    break if %w(y n).include?(answer)
    prompt("That's not a valid choice.")
  end
  answer == 'y'
end

## MAIN PROGRAM
clear_screen
scoreboard = initialize_scoreboard
prompt('Welcome!')

loop do
  table = initialize_table
  deal_first_round!(table, scoreboard)
  display_table(table)

  player_turn!(table, scoreboard)

  if player_bust?(scoreboard, 'Player')
    round_winner = 'Dealer'
    prompt('Ya BUST! Dealer wins!')
  else
    dealer_turn!(table, scoreboard)

    if player_bust?(scoreboard, 'Dealer')
      round_winner = 'Player'
      prompt('The dealer busts.. you win.')
    else
      round_winner = determine_round_winner(scoreboard)
      case round_winner
      when 'Player' then prompt('You win.. this time..')
      when 'Dealer' then prompt('You LOSE! Dealer wins!')
      else               prompt("It's a tie.")
      end
    end
  end

  update_round_results!(scoreboard, round_winner)

  break if !play_again?
  clear_screen
end

prompt('Goodbye!')
