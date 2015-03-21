class AddGameIdToPlayersAndCards < ActiveRecord::Migration
  def up
    add_column :players, :game_id, :integer, null: false, uniqueness: true
    add_column :cards, :game_id, :integer, uniqueness: true
  end
  def down
    remove_column :players, :game_id
    remove_column :cards, :game_id
  end
end
