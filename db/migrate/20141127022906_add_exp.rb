class AddExp < ActiveRecord::Migration
  def change

    change_table :heros do |t|
      t.integer :experience
    end

  end
end
