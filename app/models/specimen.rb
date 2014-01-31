class Specimen < ActiveRecord::Base
  belongs_to :species
  attr_accessible :adult, :code, :collection_date, :collection_site, :picture, :sex, :weight, :species_attributes
  accepts_nested_attributes_for :species

  # Convert sex to format stored in db
  def sex=(sex)
    if sex == 'Male'
      self[:sex] = 0
    elsif sex == 'Female'
      self[:sex] = 1
    else    
      self[:sex] = 2
    end
  end

  # Convert sex to human readable format
  def sex
    if self[:sex] == 0
      'Male'
    elsif self[:sex] == 1
      'Female'
    else
      'N/A'
    end
  end

  # Return 'adult' if the specimen is adult, else 'juvenile'
  def age
    if self[:adult]
      'Adult'
    else
      'Juvenile'
    end
  end

end
