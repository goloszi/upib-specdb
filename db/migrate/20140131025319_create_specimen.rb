class CreateSpecimen < ActiveRecord::Migration
  def change
    create_table :specimen do |t|
      t.string :collection_site
      t.date :collection_date
      t.string :code
      t.string :picture
      t.integer :sex
      t.decimal :weight
      t.integer :age
      t.references :species

      t.timestamps
    end
    add_index :specimen, :species_id
  end
end
