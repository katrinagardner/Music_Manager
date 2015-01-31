CREATE TABLE artists (
  id INTEGER PRIMARY KEY,
  name TEXT

);


CREATE TABLE albums (
  id INTEGER PRIMARY KEY,
  name TEXT,
  artist_id INTEGER references artists

);


CREATE TABLE songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album_id INTEGER references albums
);
