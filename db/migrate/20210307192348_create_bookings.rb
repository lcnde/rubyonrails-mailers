class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
      t.text :email
      t.integer :billing

      t.timestamps
    end
  end
end
