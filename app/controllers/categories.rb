get '/categories' do
  @categories = Category.all
  erb :'index'
end

get '/categories/:id' do |id|
  @category = Category.find(id)
  @subcategories = @category.subcategories
  erb ("categories/#{params[id]}/subcategories/")
end

