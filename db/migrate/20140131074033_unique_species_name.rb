class UniqueSpeciesName < ActiveRecord::Migration
  def up
    
    add_index :species, :species_name, :unique => true
  end

  def down
  end
end
