class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|

      t.string    :name
      t.references :category
    end
  end
end
