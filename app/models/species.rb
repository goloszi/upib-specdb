class Species < ActiveRecord::Base
  has_many :specimens, :dependent => :destroy
  attr_accessible :common_name, :species_name
end
