class CreateGameasps < ActiveRecord::Migration[5.2]
  def change
    create_table :gameasps do |t|
      t.integer :appid
      t.string :name
      t.string :identifier
      t.integer :price
      t.string :url
      t.boolean :api
      t.string :platform
      t.integer :game_id

      t.timestamps
    end
  end
end
