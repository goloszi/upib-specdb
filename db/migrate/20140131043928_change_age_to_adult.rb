class ChangeAgeToAdult < ActiveRecord::Migration
  def up
    rename_column :specimens, :age, :adult
    change_column :specimens, :adult, :boolean
  end

  def down
  end
end
