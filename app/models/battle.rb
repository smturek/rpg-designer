class Battle < ActiveRecord::Base

  belongs_to :hero
  belongs_to :monster

end
