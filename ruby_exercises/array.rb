a = [1]*16

#solution 1
counter = 0
string = ""
a.each do |i|
	string = string + i.to_s + " "
	counter += 1
	if counter%4 == 0
		puts string
		string = ""
	end
end

#solution 2
a.each_slice(4) {|i| p i}