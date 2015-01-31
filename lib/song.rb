require 'active_record'

class Songs < ActiveRecord::Base
  def tracks
    Albums.find_by({id:self.album_id})
  end
end

#dinklage.house will go through the houses id's until it finds the house with an id that == dinklage's house_id.
