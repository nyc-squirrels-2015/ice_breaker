class Subcategory < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category
  has_many :quotes
  has_many :users, through: :quotes
end
