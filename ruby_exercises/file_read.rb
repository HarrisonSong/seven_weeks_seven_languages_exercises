counter = 1
#solution 1 - Read file and close
file = File.new("tree.rb", "r")
while(line = file.gets)
	puts "#{counter}: #{line}"
	counter += 1
end
file.close

#solution 2 - Read file to block
File.open("tree.rb") do |openedFile|
	while (line = openedFile.gets)
		puts "#{counter}: #{line}"
		counter += 1
	end
end

# Comparaison: Using block reduces lines of codes. You won't forget to close the file and 
# also you don't need to define extra variable to hold the file.

#solution 3 - Read file with exception handling
begin
	file = File.new("Tree.rb", "r")
	while (line = file.gets)
		puts "#{counter}: #{line}"
		counter += 1
	end
	file.close
rescue => error
	puts "exception: #{error}"
	error
end
