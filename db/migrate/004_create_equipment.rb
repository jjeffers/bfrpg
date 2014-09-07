class CreateEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
        t.column :name, :string
        t.column :cost, :decimal, :precision => 8, :scale => 2, :default => 1
        t.column :weight, :decimal, :precision => 8, :scale => 2, :default => 0
    end
  end

  def self.down
    drop_table :equipment
  end
end
