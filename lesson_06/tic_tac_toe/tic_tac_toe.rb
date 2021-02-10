# tic tac toe game

require 'pry'
require 'pry-byebug'
require 'yaml'
DATA = YAML.load_file('tic_tac_toe_data.yml')
MESSAGE = DATA['message']
INFINITY = Float::INFINITY

## METHOD DEFINITIONS
# rubocop:disable Style/EmptyCaseCondition
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
# rubocop:enable Style/EmptyCaseCondition

def clear_screen
  (system 'clear') || (system 'cls')
end

# rubocop:disable Metrics/AbcSize
def display_rows(brd)
  all_rows = winning_rows(BOARD_SIZE)
  all_rows.each_with_index do |row, row_idx|
    pieces = []
    row.each_with_index do |square_num, square_idx|
      str = "  " + brd[square_num].to_s
      str += "  " unless square_idx == BOARD_SIZE - 1
      pieces << str
    end
    puts "     |" * (BOARD_SIZE - 1)
    puts pieces.join('|')
    puts "     |" * (BOARD_SIZE - 1)
    puts ("-----+" * BOARD_SIZE).chop unless row_idx == BOARD_SIZE - 1
  end
end
# rubocop:enable Metrics/AbcSize

def display_board(brd)
  clear_screen
  puts "You (Player) are #{PLAYER_MARKER}s. Computer is #{COMPUTER_MARKER}s."
  puts ""
  display_rows(brd)
  puts ""
end

def winning_rows(dimension)
  winning_rows = []
  (1..MAX_TURNS).step(dimension) do |x|
    row = []
    (0..dimension - 1).each do |y|
      row << x + y
    end
    winning_rows << row
  end
  winning_rows
end

def winning_columns(dimension)
  winning_columns = []
  (1..dimension).each do |x|
    column = []
    (x..MAX_TURNS).step(dimension) do |y|
      column << y
    end
    winning_columns << column
  end
  winning_columns
end

def winning_diagonals(dimension, winning_rows, winning_columns)
  diagonal1 = []
  diagonal2 = []
  (0..dimension - 1).each do |idx|
    other_idx = (dimension - 1) - idx
    diagonal1 << winning_rows[idx][idx]
    diagonal2 << winning_columns[other_idx][idx]
  end
  [diagonal1, diagonal2]
end

def winning_lines(dimension)
  winning_rows = winning_rows(dimension)
  winning_columns = winning_columns(dimension)
  winning_diagonals = winning_diagonals(dimension, winning_rows,
                                        winning_columns)
  winning_rows + winning_columns + winning_diagonals
end

def initialize_scoreboard
  { game_score: { Player: 0, Computer: 0 },
    round: 1,
    game_complete: false,
    game_winner: '' }
end

def initialize_board
  new_board = {}
  (1..MAX_TURNS).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def copy_of_board_state(brd)
  brd_copy = Hash.new(INITIAL_MARKER)
  (1..MAX_TURNS).each { |num| brd_copy[num] = brd[num] }
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

def center_square
  MAX_TURNS.odd? ? (MAX_TURNS + 1) / 2 : nil
end

# rubocop:disable Metrics/CyclomaticComplexity
def find_at_risk_squares(brd, marker, depth=1)
  at_risk = []
  depth = 1 if BOARD_SIZE == 3 # if board is 3x3, should always do depth of 1
  WINNING_LINES.each do |line|
    squares = brd.values_at(*line)
    if squares.count(marker) == BOARD_SIZE - depth &&
       squares.count(INITIAL_MARKER) == depth
      line.each do |square|
        at_risk << square if brd[square] == INITIAL_MARKER
      end
    end
  end
  at_risk = at_risk.sort_by { |square| at_risk.count(square) }.reverse

  at_risk.empty? ? nil : at_risk
end
# rubocop:enable Metrics/CyclomaticComplexity

# rubocop:disable Style/EmptyCaseCondition
def find_competitive_square(brd)
  immediate_wins = find_at_risk_squares(brd, COMPUTER_MARKER)
  immediate_threats = find_at_risk_squares(brd, PLAYER_MARKER)
  # p immediate_wins  # for testing output
  # p immediate_threats  # for testing output
  center = center_square
  if BOARD_SIZE > 3
    look_ahead_wins = find_at_risk_squares(brd, COMPUTER_MARKER, 2)
    look_ahead_threats = find_at_risk_squares(brd, PLAYER_MARKER, 2)
    # p look_ahead_wins  # for testing output
    # p look_ahead_threats  # for testing output
  end

  case
  when !!immediate_wins                       then immediate_wins.first
  when !!immediate_threats                    then immediate_threats.first
  when brd[center] == INITIAL_MARKER          then center
  when BOARD_SIZE > 3 && !!look_ahead_wins    then look_ahead_wins.first
  when BOARD_SIZE > 3 && !!look_ahead_threats then look_ahead_threats.first
  else                                             empty_squares(brd).sample
  end
end
# rubocop:enable Style/EmptyCaseCondition

# rubocop:disable Style/EmptyCaseCondition
def check_for_terminal_node(brd)
  certain_win = detect_round_winner(brd, true) == 1
  certain_loss = !!find_at_risk_squares(brd, PLAYER_MARKER)
  certain_tie = draw_round?(brd)

  terminal_node = certain_tie || certain_win || certain_loss
  node_value = case
               when certain_win   then 100
               when certain_loss  then -100
               when certain_tie   then 0
               else               empty_squares(brd).length
               end
  return terminal_node, node_value
end
# rubocop:enable Style/EmptyCaseCondition

def negamax(square, brd, depth, side=1)
  brd_copy = copy_of_board_state(brd)
  marker = side.positive? ? COMPUTER_MARKER : PLAYER_MARKER
  brd_copy[square] = marker

  terminal_node, value = check_for_terminal_node(brd_copy)

  if terminal_node || depth == 0
    return side * depth * value
  end

  value = -INFINITY

  empty_squares(brd_copy).each do |sq|
    value = [value, -negamax(sq, brd_copy, (depth - 1), -side)].max
  end

  value
end

def find_negamax_square(brd, depth=PLIES, side=1)
  empty_squares = empty_squares(brd)
  return center_square if brd[center_square] == INITIAL_MARKER
  return find_competitive_square(brd) if empty_squares.length > 9

  empty_squares.max_by do |square|
    negamax_value = negamax(square, brd, depth, side)
    # puts "#{square}: #{negamax_value}"  # for testing output
    negamax_value
  end
end

def minimax(square, brd, depth, side=1)
  brd_copy = copy_of_board_state(brd)
  marker = side.positive? ? COMPUTER_MARKER : PLAYER_MARKER
  brd_copy[square] = marker

  terminal_node, value = check_for_terminal_node(brd_copy)

  if terminal_node || depth == 0
    return depth * value
  end

  case side
  when 1 # Computer aka maximizing player
    value = -INFINITY
    empty_squares(brd_copy).each do |sq|
      value = [value, minimax(sq, brd_copy, (depth - 1), -side)].max
    end

    value
  when -1 # Player aka minimizing player
    value = INFINITY
    empty_squares(brd_copy).each do |sq|
      value = [value, minimax(sq, brd_copy, (depth - 1), -side)].min
    end

    value
  end
end

def find_minimax_square(brd, depth=PLIES, side=1)
  empty_squares = empty_squares(brd)
  return center_square if brd[center_square] == INITIAL_MARKER
  return find_competitive_square(brd) if empty_squares.length > 9

  empty_squares.max_by do |square|
    minimax_value = minimax(square, brd, depth, side)
    # puts "#{square}: #{minimax_value}"  # for testing output
    minimax_value
  end
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
  best_square = case DIFFICULTY
                when 'competitive' then find_competitive_square(brd)
                when 'impossible1' then find_negamax_square(brd)
                when 'impossible2' then find_minimax_square(brd)
                end
  # p best_square  # for testing output
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
    squares = brd.values_at(*line)
    if squares.count(PLAYER_MARKER) == BOARD_SIZE
      return output_as_num ? -1 : "Player"
    elsif squares.count(COMPUTER_MARKER) == BOARD_SIZE
      return output_as_num ? 1 : "Computer"
    end
  end
  nil
end

def draw_round?(brd)
  WINNING_LINES.all? do |line|
    squares = brd.values_at(*line)
    squares.include?(PLAYER_MARKER) && squares.include?(COMPUTER_MARKER)
  end
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

## GAME CONFIGURATIONS
## adjustable settings:
BOARD_SIZE = 5                    # ADJUSTABLE, ex: 3 or 5
ROUNDS_TO_WIN = 5                 # ADJUSTABLE
USER_CHOOSES_FIRST_MOVE = false   # ADJUSTABLE, options: true, false
FIRST_MOVE = 'Alternate'          # ADJUSTABLE, options: 'Player', 'Computer',
                                  #   or 'Alternate'
DIFFICULTY = 'impossible2'        # ADJUSTABLE, options: 'competitive',
                                  #   'impossible1', 'impossible2'

## not adjustable:
PLIES = case BOARD_SIZE # recommended max plies
        when 3 then 10
        when 5 then 10
        else        3
        end
MAX_TURNS = BOARD_SIZE**2
WINNING_LINES = winning_lines(BOARD_SIZE)
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
NUMBER_OF_PLAYERS = 2

## MAIN PROGRAM
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
    break if someone_won_round?(board) || draw_round?(board)
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
