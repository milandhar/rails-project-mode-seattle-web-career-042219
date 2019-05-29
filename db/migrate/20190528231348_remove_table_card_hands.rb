class RemoveTableCardHands < ActiveRecord::Migration[5.2]
  def change
    drop_table :table_card_hands
  end
end
