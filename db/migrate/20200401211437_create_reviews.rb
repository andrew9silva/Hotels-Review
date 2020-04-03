class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.date :date_visited
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :hotel, foreign_key: true

      t.timestamps
    end
  end
end
