class ChangeCardValueToInteger < ActiveRecord::Migration[5.2]
  def up
    change_column :cards, :value, :integer
  end

  def down
    change_column :cards, :value, :string
  end
end
