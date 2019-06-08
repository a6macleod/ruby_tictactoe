#!/usr/local/bin/ruby
# Tic Tac Toe 

class TicTacToeBoard
	attr_reader :game_board, :current_player_symbol, :current_player_name

	def initialize
		@game_board = [1,2,3,4,5,6,7,8,9]
		@current_player_symbol
		@current_player_name
		@game_over = false
		@turn_toggle = rand(1..2) #randomly starts odd or even
	end

	def display_board
		puts "| #{game_board[0]} #{game_board[1]} #{game_board[2]} |\n| #{game_board[3]} #{game_board[4]} #{game_board[5]} |\n| #{game_board[6]} #{game_board[7]} #{game_board[8]} |\n"
	end

	def board_check(player_pick) 
		if player_pick.include?(1..9) && game_board[player_pick - 1] == Integer
			player_choice(player_pick)
		else
			puts "Please enter the number a corresponding space not already occupied"
			display_board
	end

	def player_choice(player_pick) 
		array_position = player_pick.to_i - 1
		game_board[array_position] = current_player_symbol
		display_board
		if winner_check ? winner_message : next_player
	end

	def winner_check
    	case player_symbol
    			when game_board[1] == current_player_symbol && game_board[2] == current_player_symbol && game_board[3] == current_player_symbol
    				winner_message
    			when game_board[4] == current_player_symbol && game_board[5] == current_player_symbol && game_board[6] == current_player_symbol
    				winner_message
    			when game_board[7] == current_player_symbol && game_board[8] == current_player_symbol && game_board[9] == current_player_symbol
    				winner_message
    			when game_board[1] == current_player_symbol && game_board[4] == current_player_symbol && game_board[7] == current_player_symbol
    				winner_message
    			when game_board[2] == current_player_symbol && game_board[5] == current_player_symbol && game_board[8] == current_player_symbol
    				winner_message
    			when game_board[3] == current_player_symbol && game_board[6] == current_player_symbol && game_board[9] == current_player_symbol
    				winner_message
    			when game_board[1] == current_player_symbol && game_board[5] == current_player_symbol && game_board[9] == current_player_symbol
    				winner_message
    			when game_board[3] == current_player_symbol && game_board[5] == current_player_symbol && game_board[7] == current_player_symbol
    				winner_message
    			end		
	end

	def winner_message
		puts "WOW #{current_player_name} has won!"
		self.game_over = true
	end

	def next_player(turn_toggle)
		turn_toggle += 1
		current_player
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

puts "Are you ready to play Tic Tac Toe? (yes/no): "

start_game = gets.chomp
unless start_game.downcase == "no"
	TicTacToeBoard.new
	puts "Player 1 is 'X' and Player 2 is 'O' "
	TicTacToeBoard.display_board
	game_play
end

def game_play
	until TicTacToeBoard.game_over == true
		game_turn
	end
	puts "Great game!"
end

def game_turn
	puts "#{TicTacToeBoard.current_player_name} picks: "
	player_pick = gets.chomp.to_i
	TicTacToeBoard.board_check(player_pick)
end
