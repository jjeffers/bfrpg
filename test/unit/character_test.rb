require File.dirname(__FILE__) + '/../test_helper'

class EncumbranceTest < Test::Unit::TestCase

    def setup
        @character = Character.new
                
    end

    def testHalflingLightLoad

        @character.race = "Halfling"
        @character.strength = 12
        @character.add_equipment("junk", 0, 15)

        assert_equal("Light Load", @character.load_category)
    end

    def testHalflingLightLoadStr3

        @character.race = "Halfling"
        @character.strength = 3
        @character.add_equipment("junk", 0, 15)

        assert_equal("Light Load", @character.load_category)
    end

    def testHalflingLightLoadStr5

        @character.race = "Halfling"
        @character.strength = 5
        @character.add_equipment("junk", 0, 30)

        assert_equal("Light Load", @character.load_category)
    end

    def testHalflingLightLoadStr7

        @character.race = "Halfling"
        @character.strength = 7
        @character.add_equipment("junk", 0, 40)

        assert_equal("Light Load", @character.load_category)
    end

     def testHalflingLightLoadStr13

        @character.race = "Halfling"
        @character.strength = 13
        @character.add_equipment("junk", 0, 55)

        assert_equal("Light Load", @character.load_category)
    end

    def testHalflingLightLoadStr16

        @character.race = "Halfling"
        @character.strength = 16
        @character.add_equipment("junk", 0, 60)

        assert_equal("Light Load", @character.load_category)
    end

    def testHalflingLightLoadStr18

        @character.race = "Halfling"
        @character.strength = 18
        @character.add_equipment("junk", 0, 65)

        assert_equal("Light Load", @character.load_category)
    end
    
    def testHalflingLightLoad

        @character.race = "Halfling"
        @character.strength = 12
        @character.add_equipment("junk", 0, 15)

        assert_equal("Light Load", @character.load_category)
    end

    def testHalflingHeavyLoad

        @character.race = "Halfling"
        @character.strength = 12
        @character.add_equipment("junk", 0, 55)
        
        assert_equal(55, @character.encumbrance)
        assert_equal("Heavy Load", @character.load_category)
    end

    def testHalflingHeavyLoadStr3

        @character.race = "Halfling"
        @character.strength = 3
        @character.add_equipment("junk", 0, 40)

        assert_equal("Heavy Load", @character.load_category)
    end

    def testHalflingHeavyLoadStr5

        @character.race = "Halfling"
        @character.strength = 5
        @character.add_equipment("junk", 0, 60)

        assert_equal("Heavy Load", @character.load_category)
    end

    def testHalflingHeavyLoadStr7

        @character.race = "Halfling"
        @character.strength = 7
        @character.add_equipment("junk", 0, 80)

        assert_equal("Heavy Load", @character.load_category)
    end

    def testHalflingHeavyLoadStr14

        @character.race = "Halfling"
        @character.strength = 14
        @character.add_equipment("junk", 0, 110)

        assert_equal("Heavy Load", @character.load_category)
    end

    def testHalflingHeavyLoadStr16

        @character.race = "Halfling"
        @character.strength = 16
        @character.add_equipment("junk", 0, 120)

        assert_equal("Heavy Load", @character.load_category)
    end

    def testHalflingHeavyLoadStr18

        @character.race = "Halfling"
        @character.strength = 18
        @character.add_equipment("junk", 0, 130)

        assert_equal("Heavy Load", @character.load_category)
    end

    def testHumanLightLoad

        @character.race = "Human"
        @character.strength = 12
        @character.add_equipment("junk", 0, 55)

        assert_equal("Light Load", @character.load_category)
    end
    
    def testHumanLightLoadStr3

        @character.race = "Human"
        @character.strength = 3
        @character.add_equipment("junk", 0, 25)

        assert_equal("Light Load", @character.load_category)
    end
    
    def testHumanLightLoadStr5

        @character.race = "Human"
        @character.strength = 5
        @character.add_equipment("junk", 0, 35)

        assert_equal("Light Load", @character.load_category)
    end
    
    def testHumanLightLoadStr8

        @character.race = "Human"
        @character.strength = 8
        @character.add_equipment("junk", 0, 50)

        assert_equal("Light Load", @character.load_category)
    end
    

    def testHumanHeavyLoad

        @character.race = "Human"
        @character.strength = 12
        @character.add_equipment("junk", 0, 145)
        
        assert_equal("Heavy Load", @character.load_category)
    end

     def testHumanHeavyLoadStr3

        @character.race = "Human"
        @character.strength = 3
        @character.add_equipment("junk", 0, 60)
        
        assert_equal("Heavy Load", @character.load_category)
     end

     def testHumanLightLoadStr13

        @character.race = "Human"
        @character.strength = 13
        @character.add_equipment("junk", 0, 65)

        assert_equal("Light Load", @character.load_category)
    end
    
    def testHumanLightLoadStr16

        @character.race = "Human"
        @character.strength = 16
        @character.add_equipment("junk", 0, 70)

        assert_equal("Light Load", @character.load_category)
    end
    
    def testHumanLightLoadStr18

        @character.race = "Human"
        @character.strength = 18
        @character.add_equipment("junk", 0, 80)

        assert_equal("Light Load", @character.load_category)
    end
    
      def testHumanHeavyLoadStr5

        @character.race = "Human"
        @character.strength = 5
        @character.add_equipment("junk", 0, 90)
        
        assert_equal("Heavy Load", @character.load_category)
      end

      def testHumanHeavyLoadStr7

        @character.race = "Human"
        @character.strength = 7
        @character.add_equipment("junk", 0, 120)
        
        assert_equal("Heavy Load", @character.load_category)
      end

    def testHumanHeavyLoadStr14

        @character.race = "Human"
        @character.strength = 14
        @character.add_equipment("junk", 0, 165)
        
        assert_equal("Heavy Load", @character.load_category)
    end

    def testHumanHeavyLoadStr17

        @character.race = "Human"
        @character.strength = 17
        @character.add_equipment("junk", 0, 180)
        
        assert_equal("Heavy Load", @character.load_category)
    end

    def testHumanHeavyLoadStr18

        @character.race = "Human"
        @character.strength = 18
        @character.add_equipment("junk", 0, 195)
        
        assert_equal("Heavy Load", @character.load_category)
    end
    
    def testHumanLoadTooHeavy

        @character.race = "Human"
        @character.strength = 12
        @character.add_equipment("junk", 0, 155)
        
        assert_equal(155, @character.encumbrance)
        assert_equal("Load Too Heavy", @character.load_category)
    end
    
end


class EquipmentTest < Test::Unit::TestCase
    
    def setup
        
        @character = Character.new
        @character.rollAbilityScores()
        @character.add_equipment("backpack", 4, 0.1)
        @character.add_equipment("sword", 40, 4)
        @character.add_equipment("shield", 15, 1)
        @character.add_equipment("clothing", 1, 1)
        @character.money = 100
    end

  # Replace this with your real tests.
  def test_adding_equipment_adds_to_weight
      assert_equal(6.1, @character.encumbrance)
  end

  def test_adding_equipment_deducts_from_money
      assert_equal(40, @character.money)
  end

  def test_cannot_buy_more_than_you_can_afford
      @character.add_equipment("golden goose", 1000, 40)

      @character.equipment.each do |equipment_item|
          assert_not_equal(equipment_item.name, @character.equipment.index("golden goose"))
      end

      assert_equal(40, @character.money)
  end

  def test_removing_equipment
      @character.remove_equipment("shield", 15, 1)

      @character.equipment.each do |equipment_item|
          assert_not_equal(equipment_item.name, @character.equipment.index("shield"))
      end
      
      assert_equal(55, @character.money)
      assert_equal(5.1, @character.encumbrance)
  end
  
end
