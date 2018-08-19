class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :image
      t.text :context

      t.timestamps
    end
  end
end
