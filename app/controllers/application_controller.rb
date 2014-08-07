class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
  def login_required
    player = Player.find_by(name: session['username'])
    if player.blank?
      redirect_to '/players'
    end
  end 
    
end
  