class Quote < ActiveRecord::Base
  #ZM: Remove this comment --V 
  # Remember to create a migration!
  belongs_to :user
  belongs_to :subcategory
end
