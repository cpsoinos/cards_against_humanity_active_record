require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
  enable :sessions
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get "/" do
  @title = "Cards Against Humanity"
  games = Game.all
  erb :index, locals: { games: games }
end

post "/create_game" do
  if params[:new_game_name] == ""
    session[:game] = Game.find_by(name: params[:join_game_name])
  else
    session[:game] = Game.create(name: params[:new_game_name])
  end

  player = Player.new(name: params[:player_name], game_id: session[:game].id)

  if player.save
    session[:player] = player
    session[:player_id] = player.id
    flash[:notice] = "Welcome to Cards against Humanity, #{player.name}!"
    redirect "/game/#{session[:game].id}"
  else
    flash[:notice] = "Oops! Something went wrong. Check what you're submitting."
    redirect "/"
  end

  if game.save
    flash[:notice] = "You've just started a game called #{params[:game_name]}!"
    redirect "/game/#{game.id}"
  else
    flash[:notice] = "Oops! That game name is invalid."
    redirect "/"
  end
end

get "/game/:id" do
  game = session[:game]
  player = session[:player]
  player.judge = false
  black_card = Card.where(color: "black").shuffle.shift
  white_deck = Card.where(color: "white").shuffle

  judge = game.players.sample
  judge.judge = true

  10.times do
    player.cards << white_deck.shift
  end

  erb :game, locals: { game: game, player: player, black_card: black_card }

end
