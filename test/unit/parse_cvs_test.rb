require File.dirname(__FILE__) + '/../test_helper'
require "parse_csv"

class ParseCSVTest < Test::Unit::TestCase
    
    def setup

        text = "    \"candles, 12\", 1.0, 0.1\n  "
        @stats = ParseCSV.parse_csv(text)
        
    end

    def testScanEquipmentStats
        
        assert_equal(3, @stats.size)
        assert_equal("candles, 12", @stats[0])
        assert_equal(1.0, @stats[1].to_f)
        assert_equal(0.1, @stats[2].to_f)
        
    end
end

