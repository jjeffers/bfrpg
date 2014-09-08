require "dicebag"

module Die
	def self.total(str)
		DiceBag::Roll.new(str).result().total
	end
end