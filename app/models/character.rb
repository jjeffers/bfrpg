require "die"

class Character
    
    attr_accessor   :name
    attr_accessor   :race
    attr_accessor   :profession
    attr_accessor   :strength
    attr_accessor   :intelligence
    attr_accessor   :wisdom
    attr_accessor   :dexterity
    attr_accessor   :constitution
    attr_accessor   :charisma
    attr_accessor   :hit_points
    attr_accessor   :money
    
    def initialize
        @equipment = {}
        @money = 0
        @encumbrance = 0
        
    end

    def armor_class

        ac = 11
        has_shield = false
        @equipment.each do |k, equipment_item|
            
            if equipment_item.name.index(/[Ll]eather [Aa]rmor/) != nil
                ac = 13
            elsif equipment_item.name.index(/[Cc]hain [Mm]ail/) != nil
                ac = 15
            elsif equipment_item.name.index(/[Pp]late [Mm]ail/) != nil
                ac = 17
            end

            if equipment_item.name.index(/[Ss]hield/) != nil
                has_shield = true
            end

        end

        if has_shield
            ac += 1
        end
        
        if @dexterity <= 3
            ac -= 3
        elsif @dexterity >=4 and @dexterity <= 5
            ac -= 2
        elsif @dexterity >=6 and @dexterity <= 8
            ac -= 1
        elsif @dexterity >= 13 and @dexterity <= 15
            ac += 1
        elsif @dexterity >= 16 and @dexterity <= 17
            ac += 2
        elsif @dexterity == 18
            ac += 3
        end
        
        return ac
        
    end
    
    def encumbrance
        sum = 0
        
        @equipment.each do |k,v|
            
            sum = sum + (v.weight * v.quantity)
            RAILS_DEFAULT_LOGGER.debug(k + " " + sum.to_s)
        end

        return sum
    end

    def load_category
        
        if @race == "Halfling"
            if @strength == 3
                if self.encumbrance <= 20.0
                    return "Light Load"
                elsif self.encumbrance > 20.0 and self.encumbrance <= 40
                    return "Heavy Load"
                end
            elsif @strength >= 4 and @strength <= 5
                if self.encumbrance <= 30.0
                    return "Light Load"
                elsif self.encumbrance > 30.0 and self.encumbrance <= 60
                    return "Heavy Load"
                end
            elsif @strength >= 6 and @strength <= 8
                if self.encumbrance <= 40.0
                    return "Light Load"
                elsif self.encumbrance > 40.0 and self.encumbrance <= 80
                    return "Heavy Load"
                end
            elsif @strength >= 9 and @strength <= 12
                if self.encumbrance <= 50.0
                    return "Light Load"
                elsif self.encumbrance > 50.0 and self.encumbrance <= 100
                    return "Heavy Load"
                end
            elsif @strength >= 13 and @strength <= 15
                if self.encumbrance <= 55.0
                    return "Light Load"
                elsif self.encumbrance > 55.0 and self.encumbrance <= 110
                    return "Heavy Load"
                end
            elsif @strength >= 16 and @strength <= 17
                if self.encumbrance <= 60.0
                    return "Light Load"
                elsif self.encumbrance > 60.0 and self.encumbrance <= 120
                    return "Heavy Load"
                end
            elsif @strength == 18
                if self.encumbrance <= 65.0
                    return "Light Load"
                elsif self.encumbrance > 65.0 and self.encumbrance <= 130
                    return "Heavy Load"
                end
            end
        else
            if @strength == 3
                if self.encumbrance <= 25.0
                    return "Light Load"
                elsif self.encumbrance > 25.0 and self.encumbrance <= 60
                    return "Heavy Load"
                end
            elsif @strength >= 4 and @strength <= 5
                if self.encumbrance <= 35.0
                    return "Light Load"
                elsif self.encumbrance > 35.0 and self.encumbrance <= 90
                    return "Heavy Load"
                end
            elsif @strength >= 6 and @strength <= 8
                if self.encumbrance <= 50.0
                    return "Light Load"
                elsif self.encumbrance > 50.0 and self.encumbrance <= 120
                    return "Heavy Load"
                end
            elsif @strength >= 9 and @strength <= 12
                if self.encumbrance <= 60.0
                    return "Light Load"
                elsif self.encumbrance > 60.0 and self.encumbrance <= 150
                    return "Heavy Load"
                end
            elsif @strength >= 13 and @strength <= 15
                if self.encumbrance <= 65.0
                    return "Light Load"
                elsif self.encumbrance > 65.0 and self.encumbrance <= 165
                    return "Heavy Load"
                end
            elsif @strength >= 16 and @strength <= 17
                if self.encumbrance <= 70.0
                    return "Light Load"
                elsif self.encumbrance > 70.0 and self.encumbrance <= 180
                    return "Heavy Load"
                end
            elsif @strength == 18
                if self.encumbrance <= 80.0
                    return "Light Load"
                elsif self.encumbrance > 80.0 and self.encumbrance <= 195
                    return "Heavy Load"
                end
            end
        end

        return "Load Too Heavy"
    end

    def money
        sum = @money
        
        @equipment.each do |k,v|
            sum = sum - (v.cost * v.quantity)
        end

        return sum
    end
    
    def equipment
        @equipment.values
    end
    
    def add_equipment(name, cost, weight)

        unless cost <= @money and cost >= 0 and weight > 0
            return
        end
        
        if @equipment.has_key? name
            item = @equipment[name]

            if item.cost == cost and item.weight == weight

                item.increment_quantity
                               
            end

        else
            @equipment[name] = EquipmentItem.new(name, cost, weight)
        end
    end

    def remove_equipment(name, cost, weight)
        
        if @equipment.has_key? name
            item = @equipment[name]

            if item.cost == cost and item.weight == weight
                item.decrement_quantity
            end

            if item.quantity <= 0
                @equipment.delete(item.name)
            end
        end
    end
    
    
    def rollAbilityScores

      @strength = Die.total("3d6")
      @intelligence = Die.total("3d6")
      @wisdom = Die.total("3d6")
      @dexterity = Die.total("3d6")
      @constitution = Die.total("3d6")
      @charisma = Die.total("3d6")
      @money = Die.total("3d6") * 10
      
    end

     def attr_modifier(score)
        if score == 3
            return "-3"
        elsif score >= 4 and score <= 5
            return "-2"
        elsif score >= 6 and score <= 8
            return "-1"
        elsif score >= 9 and score <= 12
            return ""
        elsif score >= 13 and score <= 15
            return "+1"
        elsif score >= 16 and score <= 17
            return "+2"
        elsif score == 18
            return "+3"
        end
        
    end

     def get_eligible_races

      races = ["Human"]

      if @constitution >= 9 and @charisma <= 17
          races << "Dwarf"
      end
      
      if @intelligence >= 9 and @constitution <= 17
          races << :Elf
      end
      
      if @dexterity >= 9 and @strength <= 17
          races << :Halfling
      end

      return races 
     end

     def get_eligible_professions

      professions = []

      if @wisdom >= 9
          professions << "Cleric"
      end
      
      if @strength >= 9
          professions << "Fighter"
      end

      if @intelligence >= 9 and @race != :Dwarf and @race != "Halfling"
          professions << "Magic-User"
      end
      
      if @dexterity >= 9
          professions << "Thief"
      end

      if @race == :Elf
          professions << "Fighter/Magic-User"
      end

      return professions 
     end

     def getExperienceNeededFor2ndLevel

         if @profession == "Cleric"
             return "1500"
         elsif @profession == "Fighter"
             return "2000"
         elsif @profession == "Magic-User"
             return "2500"
         elsif @profession == "Thief"
             return "1250"
         elsif @profession == "Fighter/Magic-User"
             return "2000/2500"
         end
         
     end

     def rollHitPoints

         hp = 0
         if @profession == "Magic-User" or @profession == "Thief"
             hp = Die.roll 1, 4
         
         elsif @profession == "Cleric" or @race == "Elf" or @race == "Halfling"
             hp = Die.roll 1, 6
         
         elsif @profession == "Fighter"
             hp = Die.total("1d8")
         end

         if @constitution == 3
             hp = hp - 3
         elsif @constitution >=4 and @constitution <= 5
             hp = hp - 2
         elsif @constitution >= 6 and @constitution <= 8
             hp = hp - 1
         elsif @constitution >= 13 and @constitution <= 15
             hp = hp + 1
         elsif @constitution >= 16 and @constitution <= 17
             hp = hp + 2
         elsif @constitution == 18
             hp = hp + 3
         end

         if hp <= 0
             hp = 1
         end
         
         return hp
     end

     def get_saving_throws

         saving_throws = {
            "Death Ray or Poison" => nil,
            "Magic Wands" => nil,
            "Paralysis or Petrify" => nil,
            "Dragon Breath" => nil,
            "Spells" => nil
         }

         if @profession == "Cleric"
             saving_throws["Death Ray or Poison"] = 11
             saving_throws["Magic Wands"] = 12
             saving_throws["Paralysis or Petrify"] = 14
             saving_throws["Dragon Breath"] = 16
             saving_throws["Spells"] = 15
         elsif @profession == "Magic-User"
             saving_throws["Death Ray or Poison"] = 13
             saving_throws["Magic Wands"] = 14
             saving_throws["Paralysis or Petrify"] = 13
             saving_throws["Dragon Breath"] = 16
             saving_throws["Spells"] = 15
         elsif @profession == "Thief"
             saving_throws["Death Ray or Poison"] = 13
             saving_throws["Magic Wands"] = 14
             saving_throws["Paralysis or Petrify"] = 13
             saving_throws["Dragon Breath"] = 16
             saving_throws["Spells"] = 15
         elsif  @profession == "Fighter"
             saving_throws["Death Ray or Poison"] = 12
             saving_throws["Magic Wands"] = 13
             saving_throws["Paralysis or Petrify"] = 14
             saving_throws["Dragon Breath"] = 15
             saving_throws["Spells"] = 17
         elsif  @profession == "Fighter/Magic-User"
             saving_throws["Death Ray or Poison"] = 12
             saving_throws["Magic Wands"] = 13
             saving_throws["Paralysis or Petrify"] = 13
             saving_throws["Dragon Breath"] = 15
             saving_throws["Spells"] = 15
         end

         if @race == "Dwarf"
             saving_throws["Death Ray or Poison"] -= 4
             saving_throws["Magic Wands"] -= 4 
             saving_throws["Paralysis or Petrify"] -= 4
             saving_throws["Dragon Breath"] -= 3
             saving_throws["Spells"] -= 4
         elsif @race == "Elf"
             saving_throws["Magic Wands"] -= 2 
             saving_throws["Paralysis or Petrify"] -= 1
             saving_throws["Spells"] -= 2
         elsif @race == "Halfling"
             saving_throws["Death Ray or Poison"] -= 4
             saving_throws["Magic Wands"] -= 4 
             saving_throws["Paralysis or Petrify"] -= 4
             saving_throws["Dragon Breath"] -= 3
             saving_throws["Spells"] -= 4
         end

         return saving_throws
     end

     def get_special_abilities

         specials = {}
         if @profession == "Thief"
             abilities = {
                "Open Locks" => "25%",
                "Remove Traps" => "20%",
                "Pick Pockets" => "30%",
                "Move Silently" => "25%",
                "Climb Walls" => "80%",
                "Hide" => "10%",
                "Listen" => "30%"}
             specials["Thief Skills"] = abilities
             specials["Sneak Attack at +4 to hit, double damage"] = ""
             
         elsif @profession == "Cleric"
             turning = {
                "Skeletons" => "13",
                "Zombies"   => "17",
                "Ghouls"    => "19"
             }
             specials["Turn Undead"] = turning
         end

         if @race == "Dwarf"
             specials["Darkvision, 60ft"] = ""
             specials["Detect slanting passageways, traps, shifting walls, and new construction  1-2 on 1d6."] = ""
         elsif @race == "Elf"
             specials["Darkvision, 60ft"] = ""
             specials["Detect secret doors 1-2 on 1d6"] = ""
             specials["Immune to paralyzing attack of ghouls"] = ""
         elsif @race == "Halfling"
             specials["+1 to hit with missile weapons"] = ""
             specials["+2 to AC when attacked by larger than man-sized"] = ""
             specials["10% chance of hiding in forest if remaining still"] = ""
             specials["30% chance of hiding indoors if remaining still"] = ""
         elsif @race == "Human"
             specials["+10% XP bonus"] = ""
         end
         
         return specials
         
     end
end
