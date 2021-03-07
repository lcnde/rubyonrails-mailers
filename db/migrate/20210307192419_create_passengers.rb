class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.text :name
      t.text :surname
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
