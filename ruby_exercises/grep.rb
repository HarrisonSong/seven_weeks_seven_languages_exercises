#Grep function
def grep(file, word)
	counter = 1
	File.open(file) do |openedFile|
		while (line = openedFile.gets)
			puts "#{counter}: #{line}" if line.include?(word)
			counter += 1
		end
	end
end