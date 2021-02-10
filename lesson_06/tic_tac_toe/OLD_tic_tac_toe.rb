# tic tac toe game

require 'pry'
require 'pry-byebug'
require 'yaml'
DATA = YAML.load_file('tic_tac_toe_data.yml')
MESSAGE = DATA['message']

INFINITY = Float::INFINITY
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
ROUNDS_TO_WIN = 5
NUMBER_OF_PLAYERS = 2
BOARD_SIZE = [3, 3]
MAX_TURNS = BOARD_SIZE.inject(&:*)
USER_CHOOSES_FIRST_MOVE = false
FIRST_MOVE = 'Alternate' # options are 'Player', 'Computer', or 'Alternate'

## method definitions
def prompt(msg1, msg2='', msg3='')
  case
  when msg3 == '' && msg2 == ''
    puts "=> #{msg1}"
  when msg3 == '' && msg2 != ''
    puts "=> #{msg1} #{msg2}"
  when msg3.start_with?('-')
    msg3 = msg3.reverse.chop.reverse
    puts "=> #{msg1} #{msg2}#{msg3}"
  else
    puts "=> #{msg1} #{msg2} #{msg3}"
  end
end

def clear_screen
  (system 'clear') || (system 'cls')
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  # clear_screen
  puts "You (Player) are #{PLAYER_MARKER}s. Computer is #{COMPUTER_MARKER}s."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_scoreboard
  { game_score: { Player: 0, Computer: 0 },
    round: 1,
    game_complete: false,
    game_winner: '' }
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def copy_of_board_state(brd)
  brd_copy = {}
  (1..9).each { |num| brd_copy[num] = brd[num] }
  brd_copy
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(ary, divider=', ', ending='or')
  case ary.length
  when 0 then ''
  when 1 then ary.first.to_s
  when 2 then ary.join(" #{ending} ")
  else
    ary[0..-2].join(divider) + "#{divider}#{ending} #{ary.last}"
  end
end

def user_choice_first_move
  answer = ''
  loop do
    prompt(MESSAGE['choose_who_first'])
    answer = gets.chomp.downcase.chr
    break if %w(p c a).include?(answer)
    prompt(MESSAGE['invalid_choice'])
  end

  case answer
  when 'p' then 'Player'
  when 'c' then 'Computer'
  when 'a' then 'Alternate'
  end
end

def change_first_move!(choice)
  if FIRST_MOVE != choice
    FIRST_MOVE.replace(choice)
  end
end

def determine_turn_order(scoreboard_hsh)
  players = scoreboard_hsh[:game_score].keys.map(&:to_s)
  case FIRST_MOVE
  when 'Player' then players
  when 'Computer' then players.reverse
  when 'Alternate'
    scoreboard_hsh[:round].odd? ? players : players.reverse
  end
end

# rubocop:disable Metrics/CyclomaticComplexity
def find_at_risk_squares(brd, marker)
  at_risk = []
  WINNING_LINES.each do |line|
    squares = brd.values_at(*line)
    if squares.count(marker) == 2 &&
       squares.count(INITIAL_MARKER) == 1
      line.each do |square|
        at_risk << square if brd[square] == INITIAL_MARKER
      end
    end
  end
  at_risk = at_risk.sort_by { |square| at_risk.count(square) }.reverse

  at_risk.empty? ? nil : at_risk
end
# rubocop:enable Metrics/CyclomaticComplexity

# # remaining immediate wins
# def heuristic_value_of_node(brd)
#   empty_squares = empty_squares(brd)
#   winner = detect_round_winner(brd)
#   !!winner ? INFINITY : empty_squares.length
# end

def negamax(square, brd, depth, side=1)
  brd = copy_of_board_state(brd)
  marker = side == 1 ? COMPUTER_MARKER : PLAYER_MARKER
  brd[square] = marker

  empty_squares = empty_squares(brd)
  winner = detect_round_winner(brd, true)

  if ( !!winner || empty_squares.empty? ) || depth == 0
    heuristic_value = !!winner ? winner * depth * 1000 : 0
    ## try at_risk
    ## or try depth -1 for other player ? weight win more
    return side * heuristic_value
  end

  value = -1000

  empty_squares.each do |sq|
    value = [value, -negamax(sq, brd, depth - 1, -side)].max
  end

  value
end

def find_negamax_square(brd, depth=10, side=1)
  empty_squares = empty_squares(brd)
  empty_squares.max_by do |square|
    negamax(square, brd, depth, side)
  end
end


def find_minimax_value(brd, side='Computer')
  # look for largest value of the empty_squares
  empty_squares = empty_squares(brd)
  empty_squares.max_by do |square|
    value_of_square(square, brd, side)
  end
end

# find the largest value to then take away from the other user
#def value_of_square_to_comp(square, brd, player='Computer')
def value_of_square(square, brd, side)
  case side
  when 'Computer'
    marker = COMPUTER_MARKER
    next_round = 'Player'
    immediate_wins = find_at_risk_squares(brd, COMPUTER_MARKER)
    #immediate_threats = find_at_risk_squares(brd, PLAYER_MARKER)
  when 'Player'
    marker = PLAYER_MARKER
    next_round = 'Computer'
    immediate_wins = find_at_risk_squares(brd, PLAYER_MARKER)
    #immediate_threats = find_at_risk_squares(brd, COMPUTER_MARKER)
  end

  immediate_wins = find_at_risk_squares(brd, marker)
  return 100 if !immediate_wins.nil? && immediate_wins.include?(square)
  # when immediate_threats.include?(square) then -100

  brd_copy = {}
  (1..9).each { |num| brd_copy[num] = brd[num] }
  brd_copy[square] = marker

  #find_minimax_value(brd_copy, next_round)

  empty_squares = empty_squares(brd_copy)
  max_square = empty_squares.max_by do |sq|
    value_of_square(sq, brd_copy, next_round)
  end
  value_of_square(max_square, brd_copy, next_round)
end



def player_places_piece!(brd)
  square = ''
  loop do
    prompt(MESSAGE['choose_square'], joinor(empty_squares(brd)), '-.')
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt(MESSAGE['invalid_choice'])
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  # immediate_wins = find_at_risk_squares(brd, COMPUTER_MARKER)
  # immediate_threats = find_at_risk_squares(brd, PLAYER_MARKER)
  # p immediate_wins
  # p immediate_threats
  # square = case
  #          when !!immediate_wins          then immediate_wins.first
  #          when !!immediate_threats       then immediate_threats.first
  #          when brd[5] == INITIAL_MARKER  then 5
  #          else                                empty_squares(brd).sample
  #          end
  # brd[square] = COMPUTER_MARKER
  # # minimax = find_minimax_value(brd)
  # best_square = find_negamax_square(brd)
  empty_squares = empty_squares(brd)
  best_square = empty_squares.max_by do |square|
                  negamax = negamax(square, brd, 20)
                  puts "#{square} #{negamax}"
                  negamax
                end
  p best_square
  brd[best_square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  case player
  when 'Player'
    display_board(brd)
    player_places_piece!(brd)
  when 'Computer'
    computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_round_winner(brd, output_as_num=false)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return output_as_num ? -1 : "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return output_as_num ? 1 : "Computer"
    end
  end
  nil
end

def update_scoreboard!(scoreboard_hsh, player)
  scoreboard_hsh[:game_score][player.to_sym] += 1
  if scoreboard_hsh[:game_score][player.to_sym] >= ROUNDS_TO_WIN
    scoreboard_hsh[:game_complete] = true
    scoreboard_hsh[:game_winner] = player
  end
end

def get_score(scoreboard)
  score = []
  scoreboard[:game_score].each do |player, wins|
    score << "#{player}: #{wins}"
  end
  score.join(', ')
end

def someone_won_round?(brd)
  !!detect_round_winner(brd)
end

def someone_won_game?(scoreboard)
  scoreboard[:game_complete] && scoreboard[:game_winner] != ''
end

def get_game_winner(scoreboard_hsh)
  scoreboard_hsh[:game_winner]
end

## main program
prompt(MESSAGE['welcome'])
prompt(MESSAGE['game_rules_p1'], ROUNDS_TO_WIN, MESSAGE['game_rules_p2'])

scoreboard = initialize_scoreboard
if USER_CHOOSES_FIRST_MOVE
  change_first_move!(user_choice_first_move)
end

loop do
  board = initialize_board
  round_turn_sequence = determine_turn_order(scoreboard)

  (0...MAX_TURNS).each do |turn|
    player_idx = turn % NUMBER_OF_PLAYERS
    player = round_turn_sequence[player_idx]

    place_piece!(board, player)
    break if someone_won_round?(board) || board_full?(board)
  end

  display_board(board)
  scoreboard[:round] += 1

  if someone_won_round?(board)
    round_winner = detect_round_winner(board)
    update_scoreboard!(scoreboard, round_winner)
    prompt(round_winner, MESSAGE['wins_round'])
  else
    prompt(MESSAGE['tie_round'])
  end

  break if someone_won_game?(scoreboard)

  prompt(MESSAGE['score_announcement'], get_score(scoreboard), '-.')

  prompt(MESSAGE['next_round'])
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

if someone_won_game?(scoreboard)
  champion = get_game_winner(scoreboard)
  prompt(champion, MESSAGE['wins_game'])
end

prompt(MESSAGE['thank_you'])
