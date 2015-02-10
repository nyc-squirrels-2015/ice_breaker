class Category < ActiveRecord::Base
  #ZM: Remove this comment --V 
  # Remember to create a migration!
  has_many :subcategories
end
