require 'active_record'

class Albums < ActiveRecord::Base
  def songs
    Songs.where({album_id: self.id})
  end
  def artists
    Artists.find_by({id:self.artist_id})
  end
end

#dinklage.house will go through the houses id's until it finds the house with an id that == dinklage's house_id.
