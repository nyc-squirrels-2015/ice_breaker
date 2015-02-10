

get '/categories' do
  @categories = Category.all
  erb :categories
end

get '/categories/:id' do |id|
  @category = Category.find(id)
  #ZM: By making @category a instance variable you have access to all of the other methods and members 
  # The model has. You do not need to set all of these as instance variables. Instead reference them in the 
  # View like @category.subcategories. It will make your controllers clean.


  @subcategories = @category.subcategories
  @category_name = @category.name
  @category_id = @category.id
  erb :subcategories
end

