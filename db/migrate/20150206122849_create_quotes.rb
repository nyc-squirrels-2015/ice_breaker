class CreateQuotes < ActiveRecord::Migration
  def change
    create_table  :quotes do |t|
      t.text         :text
      t.references   :user
      t.references   :subcategory
      t.binary       :image, limit: 1.megabytes
    end
  end
end
