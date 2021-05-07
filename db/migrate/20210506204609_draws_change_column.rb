class DrawsChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :draws, :winning_numbers, :integer
  end
end
