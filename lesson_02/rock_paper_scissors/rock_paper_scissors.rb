# Rock Paper Scissors Game + Bonus Features

require 'yaml'
DATA = YAML.load_file('rock_paper_scissors_data.yml')
VALID_CHOICES_LONGHAND = DATA['valid_choices']['longhand']
VALID_CHOICES_SHORTHAND = DATA['valid_choices']['shorthand']
WINNER_COMBOS = DATA['winner_combos']
MESSAGES = DATA['messages']

MAX_GAME_WINS = 5

def clear_screen
  (system 'clear') || (system 'cls')
end

def display(key, string=nil)
  message = MESSAGES[key]
  if string.nil?
    puts "=> #{message}"
  else
    puts "=> #{message} #{string}"
  end
end

def display_user_options
  all_valid_choices_longhand = VALID_CHOICES_LONGHAND.join(', ')
  all_valid_choices_shorthand = VALID_CHOICES_SHORTHAND.join(', ')
  display('choose_from_longhand', all_valid_choices_longhand)
  display('choose_from_shorthand', all_valid_choices_shorthand)
end

def to_longhand(choice)
  index = VALID_CHOICES_SHORTHAND.index(choice)
  VALID_CHOICES_LONGHAND[index]
end

def get_user_choice
  user_choice = ''
  loop do
    display_user_options
    user_choice = gets.chomp.downcase

    if VALID_CHOICES_SHORTHAND.include?(user_choice)
      user_choice = to_longhand(user_choice)
    end

    break if VALID_CHOICES_LONGHAND.include?(user_choice)

    display('invalid_choice')
  end
  user_choice
end

def get_computer_choice
  VALID_CHOICES_LONGHAND.sample
end

def win?(first, second)
  WINNER_COMBOS[first].include?(second)
end

def determine_game_results(user, computer)
  if win?(user, computer)
    'user_wins'
  elsif win?(computer, user)
    'computer_wins'
  else
    'tie'
  end
end

def count_score(scoreboard_ary)
  scoreboard_ary.count('user_wins').to_s + ' to ' +
    scoreboard_ary.count('computer_wins').to_s
end

def match_won?(scoreboard_ary)
  (scoreboard_ary.count('user_wins') >= MAX_GAME_WINS) ||
    (scoreboard_ary.count('computer_wins') >= MAX_GAME_WINS)
end

def determine_grand_winner(scoreboard_ary)
  if scoreboard_ary.count('user_wins') >= MAX_GAME_WINS
    'user_grand_winner'
  else
    'computer_grand_winner'
  end
end

def another_game?
  answer = ''
  loop do
    display('repeat_game')
    answer = gets.chomp.downcase

    break if %w(y n).include?(answer)

    display('invalid_repeat_game')
  end
  answer == 'y'
end

## Main Loop
clear_screen
scoreboard = []

display('welcome')
display('match_rules', MAX_GAME_WINS)

loop do
  user_choice = get_user_choice
  computer_choice = get_computer_choice

  display('user_chose', user_choice)
  display('computer_chose', computer_choice)

  game_results = determine_game_results(user_choice, computer_choice)
  scoreboard << game_results
  match_score = count_score(scoreboard)

  display(game_results)
  display('score_announcement', match_score)

  if match_won?(scoreboard)
    grand_winner = determine_grand_winner(scoreboard)
    display(grand_winner)
    break
  end

  break unless another_game?
  clear_screen
end

display('thank_you')
