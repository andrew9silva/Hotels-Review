class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :price_level
      t.text :amenities
      t.belongs_to :location, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
