def current_user
  if session[:user]
    return User.find(session[:user])
  else
    return nil
  end
end
