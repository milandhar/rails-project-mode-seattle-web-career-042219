class ChangeRoundStatusDataType < ActiveRecord::Migration[5.2]
  def up
    remove_column :rounds, :active
    add_column :rounds, :status, :string
  end

  def down
    add_column :rounds, :active, :boolean
    remove_column :rounds, :status
  end
end
