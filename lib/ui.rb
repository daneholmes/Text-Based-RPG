def prompt()
	print "> ".light_red
end

def help
	puts "Commands to Aid You on Your Quest"
	puts "north/south/east/west".green + ": move in that direction."
	puts "look".green + ": examine your surroundings."
	puts "quit".green + ": end your quest like a coward."
	puts "clear".green + ": declutter your quest log."
end

def welcome
	puts `clear`
	puts "FINAL QUEST".light_green
	puts "Dane Holmes "
	puts
	puts "Type " + "help ".light_blue + "for instructions"
	puts "Or, " + "start ".light_blue + "to begin your quest"
	puts
	while true
		prompt; next_move = gets.chomp
		if next_move == "start"
			room; next_move = gets.chomp
		elsif next_move == "help"
			help;
		elsif next_move == "quit"
			Process.exit
		else
			puts "type " + "start ".light_blue + "or " + "help ".light_blue + "to begin your quest"
		end
	end
end
