require 'active_record'

class Artists < ActiveRecord::Base
  def albums
   Albums.where({artist_id:self.id})
  end
end

#slytheming.characters will go thru the characters table and return all characters that
#have the same house_id as slytheming's id.
