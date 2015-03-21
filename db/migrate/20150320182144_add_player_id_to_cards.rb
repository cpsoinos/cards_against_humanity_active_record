class AddPlayerIdToCards < ActiveRecord::Migration
  def up
    add_column :cards, :player_id, :integer, unique: true
  end
  def down
    remove_column :cards, :player_id
  end
end
