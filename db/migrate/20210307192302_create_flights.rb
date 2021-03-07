class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :departure_airport, null: false, foreign_key: {to_table: :airports}
      t.references :destination_airport, null: false, foreign_key: {to_table: :airports}
      t.datetime :date
      t.integer :flight_duration

      t.timestamps
    end
  end
end
