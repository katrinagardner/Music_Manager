require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/artist'
require_relative './lib/album'
require_relative './lib/song'

require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end

get("/artists") do
  erb(:"artists/index", { locals: { artists: Artists.all() } })
end

post '/artists' do
  artist = {
    name: params["name"]
    };
    Artists.create(artist)
    erb :"artists/index", locals: { artist: Artists.all() }
  end

get("/artists/:id") do
  artist = Artists.find_by({id: params[:id]})
  erb(:"artists/show", { locals: { artist: artist } })
end

post '/albums' do
  album = {
    name: params["name"],
    artist_id: params["artist_id"].to_i
  }
  Albums.create(album)
  artist = Artists.find_by({id: params["artist_id"].to_i})
  erb :"artists/show", locals: {artist: artist}
end


get '/albums/:id' do
  album = Albums.find_by({id: params[:id]})
  erb :"albums/show", locals: {album: album}
end


post '/songs' do
  song = {
    name: params["name"],
    album_id: params["album_id"]
  }
  Songs.create(song)
  redirect ('/albums/' + params["album_id"])
  album = Albums.find_by({id: params["album_id"]})
  erb :"albums/show", locals: {album: album}
end
