get '/'do
   if current_user
    redirect ('/categories')
  else
    redirect('/login')
  end
end

