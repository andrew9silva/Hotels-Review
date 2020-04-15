class AddCommentBoxToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :comment, :text
  end
end
