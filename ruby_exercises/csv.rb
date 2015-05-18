class CsvRow
	def method_missing name, *args
		column = name.to_s
		if column == 'one'
			@content[0]
		elsif column == 'two'
			@content[1]
		end
	end

	def initialize(row)
		@content = row
	end
end

module ActsAsCsv

	# a class callback when this module is included in another class/module.
	def self.included(base)
		puts "#{self} and #{base}"
		base.extend ClassMethods
	end

	module ClassMethods
		def act_as_csv
			include InstanceMethods
		end
	end

	module InstanceMethods
		def read
			@csv_contents = []
			filename = self.class.to_s.downcase + '.txt'
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		def each
			@csv_contents.each do |row|
				c = CsvRow.new(row)
				yield c
			end
		end

		attr_accessor :headers, :csv_contents

		def initialize 
			read
		end
	end
end

class RubyCsv 
	include ActsAsCsv
	act_as_csv
end

m = RubyCsv.new
m.each {|row| puts row.two}