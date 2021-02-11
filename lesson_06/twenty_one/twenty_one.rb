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
# NUMBER_OF_PLAYERS = 2

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

def initialize_deck
  (1..52).to_a.shuffle
end

def initialize_table
  { Player: [], Dealer:[], deck: initialize_deck }
end

def deal_round!(table)
  2.times do
    table[:Player] << table[:deck].shift
    table[:Dealer] << table[:deck].shift
  end
end

def convert_card_ids(ary_card_ids, output_key)  # accepts output_key = 'name', 'value', or 'suit'
  return nil unless %w(name value suit).include?(output_key)

  ary_card_ids.each_with_object([]) do |card_id, converted|
    converted << CARDS[card_id][output_key.to_sym]
  end
end

def bust?(player_sum)
  player_sum > 21
end

def raw_sum_of_hand(table, player)
  aces = 0
  raw_sum = table[player.to_sym].inject(0) |total, card_idx|
              if CARD[card_idx][name] == 'Ace'
                aces +=1
                total + CARD[card_idx][value][0]
              else
                total + CARD[card_idx][value]
              end
            end
  return raw_sum, aces
end

def smart_sum_of_hand(table, player)
  raw_sum, aces = raw_sum_of_hand(table, player)

  return raw_sum if aces == 0 || !bust?(player)

  if aces > 0
    raw_sum -= 10
    aces -= 1
  end

  return raw_sum if aces == 0 || !bust?(player)

  if aces > 0
    raw_sum -= 10
    aces -= 1
  end

  return raw_sum if aces == 0 || !bust?(player)

  ## MAKE THIS RECURSIVE...
end



def display_table(table)
  dealer_cards = ['unknown card'] + convert_card_ids(table[:Dealer][1..-1], 'name')
  player_cards = convert_card_ids(table[:Player], 'name')
  prompt('Dealer has:', joinor(dealer_cards))
  prompt('You have:', joinor(player_cards))
end

table = initialize_table
p table
deal_round!(table)
p table
display_table(table)

deal_round!(table)
p table
display_table(table)



##
# {1=>{:name=>"2", :value=>2, :suit=>"Hearts"},
# 2=>{:name=>"3", :value=>3, :suit=>"Hearts"},
# 3=>{:name=>"4", :value=>4, :suit=>"Hearts"},
# 4=>{:name=>"5", :value=>5, :suit=>"Hearts"},
# 5=>{:name=>"6", :value=>6, :suit=>"Hearts"},
# 6=>{:name=>"7", :value=>7, :suit=>"Hearts"},
# 7=>{:name=>"8", :value=>8, :suit=>"Hearts"},
# 8=>{:name=>"9", :value=>9, :suit=>"Hearts"},
# 9=>{:name=>"10", :value=>10, :suit=>"Hearts"},
# 10=>{:name=>"Jack", :value=>10, :suit=>"Hearts"},
# 11=>{:name=>"Queen", :value=>10, :suit=>"Hearts"},
# 12=>{:name=>"King", :value=>10, :suit=>"Hearts"},
# 13=>{:name=>"Ace", :value=>[11, 1], :suit=>"Hearts"},
# 14=>{:name=>"2", :value=>2, :suit=>"Diamonds"},
# 15=>{:name=>"3", :value=>3, :suit=>"Diamonds"},
# 16=>{:name=>"4", :value=>4, :suit=>"Diamonds"},
# 17=>{:name=>"5", :value=>5, :suit=>"Diamonds"},
# 18=>{:name=>"6", :value=>6, :suit=>"Diamonds"},
# 19=>{:name=>"7", :value=>7, :suit=>"Diamonds"},
# 20=>{:name=>"8", :value=>8, :suit=>"Diamonds"},
# 21=>{:name=>"9", :value=>9, :suit=>"Diamonds"},
# 22=>{:name=>"10", :value=>10, :suit=>"Diamonds"},
# 23=>{:name=>"Jack", :value=>10, :suit=>"Diamonds"},
# 24=>{:name=>"Queen", :value=>10, :suit=>"Diamonds"},
# 25=>{:name=>"King", :value=>10, :suit=>"Diamonds"},
# 26=>{:name=>"Ace", :value=>[11, 1], :suit=>"Diamonds"},
# 27=>{:name=>"2", :value=>2, :suit=>"Clubs"},
# 28=>{:name=>"3", :value=>3, :suit=>"Clubs"},
# 29=>{:name=>"4", :value=>4, :suit=>"Clubs"},
# 30=>{:name=>"5", :value=>5, :suit=>"Clubs"},
# 31=>{:name=>"6", :value=>6, :suit=>"Clubs"},
# 32=>{:name=>"7", :value=>7, :suit=>"Clubs"},
# 33=>{:name=>"8", :value=>8, :suit=>"Clubs"},
# 34=>{:name=>"9", :value=>9, :suit=>"Clubs"},
# 35=>{:name=>"10", :value=>10, :suit=>"Clubs"},
# 36=>{:name=>"Jack", :value=>10, :suit=>"Clubs"},
# 37=>{:name=>"Queen", :value=>10, :suit=>"Clubs"},
# 38=>{:name=>"King", :value=>10, :suit=>"Clubs"},
# 39=>{:name=>"Ace", :value=>[11, 1], :suit=>"Clubs"},
# 40=>{:name=>"2", :value=>2, :suit=>"Spades"},
# 41=>{:name=>"3", :value=>3, :suit=>"Spades"},
# 42=>{:name=>"4", :value=>4, :suit=>"Spades"},
# 43=>{:name=>"5", :value=>5, :suit=>"Spades"},
# 44=>{:name=>"6", :value=>6, :suit=>"Spades"},
# 45=>{:name=>"7", :value=>7, :suit=>"Spades"},
# 46=>{:name=>"8", :value=>8, :suit=>"Spades"},
# 47=>{:name=>"9", :value=>9, :suit=>"Spades"},
# 48=>{:name=>"10", :value=>10, :suit=>"Spades"},
# 49=>{:name=>"Jack", :value=>10, :suit=>"Spades"},
# 50=>{:name=>"Queen", :value=>10, :suit=>"Spades"},
# 51=>{:name=>"King", :value=>10, :suit=>"Spades"},
# 52=>{:name=>"Ace", :value=>[11, 1], :suit=>"Spades"}}
