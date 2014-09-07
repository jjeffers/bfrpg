class EquipmentItem

    attr_reader :quantity
    attr_reader :name
    attr_reader :cost
    attr_reader :weight

    def initialize(name, cost, weight)
        
        @name = name
        @cost = cost
        @weight = weight
        @quantity = 1
        
    end

    def increment_quantity
        @quantity += 1
    end

    def decrement_quantity
        @quantity -= 1
    end

end

