class Article < ActiveRecord::Base

  # Mass assignment protection
  attr_accessible :body, :title

  # Validations
  validates :title, :presence => true, :uniqueness => { :case_sensitive => false }, :length => { :within => 3..64 }
  validates :body, :presence => true, :length => { :minimum => 20 }

end
