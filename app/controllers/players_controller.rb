class PlayersController < ApplicationController
 before_filter :login_required, :except => [:index, :new, :create]
  
  def home
  end
  
  def sign_in
    cookies[username] = params['username']
    redirect_to'/greet'
  end

  def index
    @players = Player.all
  end

  def show
    @player = Player.find_by(id: params[:id])
  end

  def new
  end

  def create
    @player = Player.new
    @player.name = params[:name]
    @player.team = params[:team]
    @player.password = params[:password]
    @player.password_confirmation = params[:password_confirmation]
    if @player.save
      redirect_to "/players/#{ @player.id }"
    else
      render 'new'
    end
  end
  
  def edit
    @player = Player.find_by(id: params[:id])
    if @player.name != session['username']
      redirect_to "/players", :notice => "Can't access #{@player.name}, fool"
      
    end
  end 

  def update
    @player = Player.find_by(id: params[:id])
    @player.name = params[:name]
    @player.team = params[:team]
    @player.password = params[:password]
    @player.password_confirmation = params[:password_confirmation]

    if @player.save
      redirect_to "/players/#{ @player.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @player = Player.find_by(id: params[:id])
    @player.destroy


    redirect_to "/players"
  end
end
