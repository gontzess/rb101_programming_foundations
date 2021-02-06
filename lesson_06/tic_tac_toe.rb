# tic tac toe game

require 'pry'
require 'pry-byebug'
require 'yaml'
DATA = YAML.load_file('tic_tac_toe_data.yml')
MESSAGE = DATA['message']

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
ROUNDS_TO_WIN = 5

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
  clear_screen
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(ary, divider=', ', ending='or')
  case ary.length
  when 0 then ''
  when 1 then "#{ary.first}"
  when 2 then ary.join(" #{ending} ")
  else
    ary[0..-2].join(divider) + "#{divider}#{ending} #{ary.last}"
  end
end

def detect_immediate_threats(brd)
  immediate_threats = []
  WINNING_LINES.each do |line|
    values = brd.values_at(*line)
    if values.count(PLAYER_MARKER) == 2 &&
       values.count(INITIAL_MARKER) == 1
      line.each do |tile|
        immediate_threats << tile if brd[tile] == INITIAL_MARKER
      end
    end
  end
  immediate_threats.sort_by { |tile| immediate_threats.count(tile) }.reverse.uniq
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
  immediate_threats = detect_immediate_threats(brd)
  puts immediate_threats.inspect
  square = immediate_threats.empty? ? empty_squares(brd).sample :
                                      immediate_threats.first
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
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

# main program loop
scoreboard = { game_score: { Player: 0, Computer: 0 }, game_complete: false, game_winner: '' }

prompt(MESSAGE['welcome'])
prompt(MESSAGE['game_rules_p1'], ROUNDS_TO_WIN, MESSAGE['game_rules_p2'])

loop do
  board = initialize_board
  round_winner = ''

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won_round?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won_round?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won_round?(board)
    round_winner = detect_round_winner(board)
    update_scoreboard!(scoreboard, round_winner)
    prompt("#{round_winner}", MESSAGE['wins_round'])
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
  prompt("#{champion}", MESSAGE['wins_game'])
end

prompt(MESSAGE['thank_you'])
