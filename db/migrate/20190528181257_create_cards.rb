class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :suit
      t.integer :value
      t.boolean :is_dealt

      t.timestamps
    end
  end
end
