require 'active_record/fixtures'

class LoadRaceData < ActiveRecord::Migration
  def self.up
      down

      directory = File.join(File.dirname(__FILE__), "dev_data")
      Fixtures.create_fixtures(directory, "races")
  end

  def self.down
      Race.delete_all
  end
end
