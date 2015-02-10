class Subcategory < ActiveRecord::Base
  #ZM: Remove this comment --V 
  # Remember to create a migration!
  belongs_to :category
  has_many :quotes
  has_many :users, through: :quotes
end
