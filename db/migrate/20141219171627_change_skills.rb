class ChangeSkills < ActiveRecord::Migration
  def change

    change_table :skills do |t|
      t.belongs_to :hero
    end

  end
end
