class CreateHandCards < ActiveRecord::Migration[5.2]
  def change
    create_table :hand_cards do |t|
      t.belongs_to :card
      t.belongs_to :hand
    end
  end
end
