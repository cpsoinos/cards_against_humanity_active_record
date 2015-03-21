class AddJudgeToPlayer < ActiveRecord::Migration
  def up
    add_column :players, :judge, :boolean, default: false
  end
  def down
    remove_column :players, :judge
  end
end
