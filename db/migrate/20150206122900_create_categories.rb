#ZM: Where are you database constraints?
class CreateCategories < ActiveRecord::Migration
  def change
    create_table  :categories do |t|

      t.string   :name
    end
  end
end
