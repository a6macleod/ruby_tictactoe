#!/usr/local/bin/ruby
# Tic Tac Toe 

class TicTacToeBoard
	attr_accessor :display_board, :game_board, :current_player_symbol, :current_player_name, :game_over, :turn_toggle

	def initialize
		@game_board = [1,2,3,4,5,6,7,8,9]
		@current_player_symbol
		@current_player_name
		@game_over = false
		@turn_toggle = rand(1..2) #randomly starts odd or even
	end

	def display_board
		puts "\n\t| #{game_board[0]} #{game_board[1]} #{game_board[2]} |\n\t| #{game_board[3]} #{game_board[4]} #{game_board[5]} |\n\t| #{game_board[6]} #{game_board[7]} #{game_board[8]} |\n\n"
	end

	def board_check(player_pick)
		if (1..9).include?(player_pick) #&& game_board[player_pick - 1] == Integer
			player_choice(player_pick)
		else
			puts "Please enter the number a corresponding space not already occupied"
			display_board
		end
	end

	def player_choice(player_pick) 
		array_position = player_pick.to_i - 1
		game_board[array_position] = current_player_symbol
		display_board
		#winner_check ? winner_message : next_player
		next_turn
	end

	def winner_check
		puts current_player_symbol
		puts current_player_name
    	case 
		when game_board[1] == current_player_symbol && game_board[2] == current_player_symbol && game_board[3] == current_player_symbol
			true
		when game_board[4] == current_player_symbol && game_board[5] == current_player_symbol && game_board[6] == current_player_symbol
			true
		when game_board[7] == current_player_symbol && game_board[8] == current_player_symbol && game_board[9] == current_player_symbol
			true
		when game_board[1] == current_player_symbol && game_board[4] == current_player_symbol && game_board[7] == current_player_symbol
			true
		when game_board[2] == current_player_symbol && game_board[5] == current_player_symbol && game_board[8] == current_player_symbol
			true
		when game_board[3] == current_player_symbol && game_board[6] == current_player_symbol && game_board[9] == current_player_symbol
			true
		when game_board[1] == current_player_symbol && game_board[5] == current_player_symbol && game_board[9] == current_player_symbol
			true
		when game_board[3] == current_player_symbol && game_board[5] == current_player_symbol && game_board[7] == current_player_symbol
			true
		end	
	end	

	def winner_message
		puts "WOW #{current_player_name} has won!"
		self.game_over = true
	end

	def next_turn
		winner_check ? winner_message :
		self.turn_toggle += 1
		current_player(turn_toggle)
	end

	def current_player(turn_toggle)
		if turn_toggle.even? 
			self.current_player_symbol = "X"
			self.current_player_name = "Player 1"
		else
			self.current_player_symbol = "O"
			self.current_player_name = "Player 2"
		end
	end
end 

def start_game
	puts "Are you ready to play Tic Tac Toe? (yes/no): "
	user_answer = gets.chomp
	unless user_answer.downcase == "no"
		game_on = TicTacToeBoard.new
		puts "Player 1 is 'X' and Player 2 is 'O' "
		game_on.display_board
		game_on.next_turn
		game_play(game_on)
	end
end

def game_play(game_on)
	until game_on.game_over == true
		game_turn(game_on)
	end
	puts "Great game!"
end

def game_turn(game_on)
	print "#{game_on.current_player_name}(#{game_on.current_player_symbol}) picks: "
	player_pick = gets.chomp.to_i
	game_on.board_check(player_pick)
end

start_game
