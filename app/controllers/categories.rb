

get '/categories' do
  @categories = Category.all
  erb :categories
end

get '/categories/:id' do |id|
  @category = Category.find(id)
  @subcategories = @category.subcategories
  @category_name = @category.name
  @category_id = @category.id
  erb :subcategories
end

