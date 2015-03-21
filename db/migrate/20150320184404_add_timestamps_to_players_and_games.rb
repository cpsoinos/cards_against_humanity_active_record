class AddTimestampsToPlayersAndGames < ActiveRecord::Migration
  def up
    add_column :players, :created_at, :datetime
    add_column :players, :updated_at, :datetime
    add_column :games, :created_at, :datetime
    add_column :games, :updated_at, :datetime
  end
  def down
    remove_column :players, :created_at
    remove_column :players, :updated_at
    remove_column :games, :created_at
    remove_column :games, :updated_at
  end
end
