user_input_number = nil
while true
	puts "Please select on number from 1 to 10: "
	user_input_number = gets.chomp
	if user_input_number == "exit"
		break
	end
	current_number = rand(10) + 1
	if user_input_number.to_i == current_number 
		puts "Bingo! You have got the correct number!"
	else
		puts "Whops! The correct number is #{current_number}. Please try again."
	end
end