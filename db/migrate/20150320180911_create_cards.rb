class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :color, null: false
      t.string :content, null: false
    end
  end
end
