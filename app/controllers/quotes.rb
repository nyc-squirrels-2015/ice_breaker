# display quotes for a subcategory
get '/categories/:category_id/subcategories/:subcategory_id/quotes' do

  user = current_user
  p "show quotes user #{user}"
  #ZM: See how you repeate this again and again? Is there a more dry way to do this?
  if user == nil
    redirect ('/login')
  else
    @quotes = Subcategory.find(params[:subcategory_id]).quotes
    @category_id = params[:category_id]
    @subcategory_id = params[:subcategory_id]
    erb :quotes
  end
end

# return form to create new quote
get '/categories/:category_id/subcategories/:subcategory_id/quotes/new'  do
  user = current_user
  #ZM: See how you repeate this again and again? Is there a more dry way to do this?
  if user == nil
    redirect ('/login')
  else
    @category_id = params[:category_id]
    @subcategory_id = params[:subcategory_id]
    erb :'quotes_new'
  end
end

# create new quote
post '/categories/:category_id/subcategories/:subcategory_id/quotes/new'  do
  #ZM: See how you repeate this again and again? Is there a more dry way to do this?
  user = current_user
  if user == nil
    redirect ('/login')
  else

    quote_map = params[:quote]
    #ZM: do not leave debugging statements in your code when you commit. It Make Sad Zack Panda :(
    p "create new quote: #{quote_map}"
    subcategory = Subcategory.find(params[:subcategory_id])
    Quote.create(text: quote_map['text'], user: user, subcategory: subcategory)
    redirect ("/categories/#{params[:category_id]}/subcategories/#{params[:subcategory_id]}/quotes")
   end
end

get '/categories/:category_id/subcategories/:subcategory_id/quotes/:quote_id/update'  do
  p "get update quote form"
  user = current_user
  #ZM: See how you repeate this again and again? Is there a more dry way to do this?
  if user == nil
    redirect ('/login')
  else
    #ZM: This is a red flag for me, I'm not sure what you are doing, or why you need all of these as instance 
    # Variables... perhaps we can clean this up?
    @quote_id = params[:quote_id]
    @category_id = params[:category_id]
    @quote_id = params[:quote_id]
    @subcategory_id = params[:subcategory_id]
    quote = Quote.find(params[:quote_id])
    @quote_text = quote.text
    erb :quote_edit
  end
end

# update quote
put '/categories/:category_id/subcategories/:subcategory_id/quotes/:quote_id/update'  do
  p "update quote"
  user = current_user
  #ZM: See how you repeate this again and again? Is there a more dry way to do this?
  if user == nil
    redirect ('/login')
  else
    quote_map = params[:quote]
    #ZM Again with the debug statements
    p "update quote: #{quote_map}"
    quote = Quote.find(params[:quote_id])
    quote.update(text: quote_map[:text])
    redirect ("/categories/#{params[:category_id]}/subcategories/#{params[:subcategory_id]}/quotes")
  end
end

delete  '/categories/:category_id/subcategories/:subcategory_id/quotes/:quote_id/delete'  do
  p "update quote"
  user = current_user
  #ZM: See how you repeate this again and again? Is there a more dry way to do this?
  if user == nil
    redirect ('/login')
  else
    Quote.find(params[:quote_id]).destroy
    redirect ("/categories/#{params[:category_id]}/subcategories/#{params[:subcategory_id]}/quotes")
  end
end
