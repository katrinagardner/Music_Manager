require 'pry'
require_relative './lib/connection'
require_relative './lib/artist'
require_relative './lib/album'
require_relative './lib/song'

taylorswift = Artists.create({
  name: "Taylor Swift",

})

red = Albums.create({
  name: "Red",
  artist_id: taylorswift.id
})

year = Albums.create({
  name: "1989",
  artist_id: taylorswift.id
})

Songs.create({
  name: "All to well",
  album_id: red.id
})

Songs.create({
  name: "Red",
  album_id: red.id
})

Songs.create({
    name: "Style",
    album_id: year.id
})

Songs.create({
      name: "Shake it off",
      album_id: year.id
  })
