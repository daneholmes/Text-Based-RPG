require_relative "world"
require_relative "character"

def prompt()
	print "> ".light_red
end

def welcome
	puts `clear`
	puts "The Questing Game".upcase.light_green
	puts "Dane Holmes "
	puts
	puts "Type " + "help ".light_blue + "for instructions"
	puts "Or, " + "start ".light_blue + "to begin your quest"
	puts
	while true
		prompt; next_move = gets.chomp
		if next_move == "start"
			move_room()
		elsif next_move == "help"
			help()
		elsif next_move == "quit" or next_move == "quit"
			Process.exit
		else
			puts "type " + "start ".light_blue + "or " + "help ".light_blue + "to begin your quest"
		end
	end
end

def help
	puts "Commands to Aid You on Your Quest"
	puts "north/n/south/s/east/e/west/w".green + ": move in that direction."
	puts "look".green + ": re-examine your surroundings."
	puts "Blue Text".blue + ": these are unique commands, type the " + "blue text ".blue + "to complete its action."
	puts "coordinates/co".green + ": to get your bearings."
	puts "quit".green + ": end your quest like a coward."
	puts "clear".green + ": declutter your quest log."
end


def move_room
	current_room = init_world[$x][$y]
	max = init_world.length - 1
	check = init_world.length - 2
	warning = "It is impossible to move further in this direction!".light_yellow
	
	puts current_room.call
	
	while true
		prompt; next_move = gets.chomp.downcase
			if next_move == "north" or next_move == "n" && $y >= check
				$y = $y - 1
				move_room() 
			elsif next_move == "north" or next_move == "n" && $y == 0
				puts warning
			elsif next_move == "south" or next_move == "s" && $y <= check
				$y = $y + 1
				move_room() 
			elsif next_move == "south" or next_move == "s" && $y == max
				puts warning
			elsif next_move == "east" or next_move == "e" && $x <= check
				$x = $x + 1
				move_room()
			elsif next_move == "east" or next_move == "e" && $x == max
				puts warning
			elsif next_move == "west" or next_move == "w" && $x >= check
				$x = $x - 1
				move_room() 
			elsif next_move == "west" or next_move == "w" && $x == 0
				puts warning
			elsif next_move == "coordinates" or next_move == "co"
				puts "[" + $x.to_s + ", " + $y.to_s + "]"
			elsif next_move == "quit" or next_move == "q"
				Process.exit
			elsif next_move == "help"
				help()
			elsif next_move == "clear"
				puts `clear`
				move_room()
			else
				puts "Sorry, that is not an option."
			end
	end
end