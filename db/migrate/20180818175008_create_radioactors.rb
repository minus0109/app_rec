class CreateRadioactors < ActiveRecord::Migration[5.2]
  def change
    create_table :radioactors do |t|
      t.string :name
      t.boolean :sex

      t.timestamps
    end
  end
end
