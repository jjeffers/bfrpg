module Die
    
    def Die.roll(number_of_dice, sides_of_dice)
        
        sum = 0

        number_of_dice.times { sum += (1 + rand(sides_of_dice)) }

        return sum
    end
    
end
