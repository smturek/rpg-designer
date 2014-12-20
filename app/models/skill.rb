class Skill < ActiveRecord::Base

  validates :name, uniqueness: true

  belongs_to :hero

end
