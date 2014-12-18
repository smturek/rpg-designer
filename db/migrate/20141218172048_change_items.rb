class ChangeItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.belongs_to :hero
    end
  end
end
