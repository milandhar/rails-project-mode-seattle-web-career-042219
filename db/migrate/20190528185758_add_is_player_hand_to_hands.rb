class AddIsPlayerHandToHands < ActiveRecord::Migration[5.2]
  def change
    add_column :hands, :is_player_hand, :boolean
  end
end
