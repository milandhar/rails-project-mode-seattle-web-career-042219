class AddStatusToRound < ActiveRecord::Migration[5.2]
  def change
    add_column :rounds, :active, :boolean
  
  end
end
