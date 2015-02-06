class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :subcategories
end
