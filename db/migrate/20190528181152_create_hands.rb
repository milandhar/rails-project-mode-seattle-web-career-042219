class CreateHands < ActiveRecord::Migration[5.2]
  def change
    create_table :hands do |t|
      t.integer :round_id


      t.timestamps
    end
  end
end
