class Species < ActiveRecord::Base
  has_many :specimens, :dependent => :destroy, :uniq => true
  attr_accessible :common_name, :species_name
  validates :species_name, :presence => true, :uniqueness => true
end
