class AddLevelToHero < ActiveRecord::Migration
  def change

    change_table :heros do |t|
      t.integer :level, default: 1, null: 1
    end

  end
end
