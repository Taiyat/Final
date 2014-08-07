class SessionsController < ApplicationController 

  def new
  end
  
  def create 
    p = Player.find_by_name(params['username'])
    if p && p.authenticate(params['password'])
      session['username'] = p.name
      redirect_to '/home'
    else
      redirect_to '/sessions/new'
    end
  end 
  
  def destroy 
    reset_session
    redirect_to '/sessions/new'
  end 
end 