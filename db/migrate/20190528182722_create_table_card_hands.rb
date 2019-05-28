class CreateTableCardHands < ActiveRecord::Migration[5.2]
  def change
    create_table :table_card_hands do |t|
      t.belongs_to :card
      t.belongs_to :hand
    end
  end
end
