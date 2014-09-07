require 'active_record/fixtures'

class LoadEquipmentData < ActiveRecord::Migration
  def self.up
      down

      directory = File.join(File.dirname(__FILE__), "dev_data")
      Fixtures.create_fixtures(directory, "equipment")
  end

  def self.down
      Equipment.delete_all
  end
end
