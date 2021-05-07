class DrawsChangeColumn2 < ActiveRecord::Migration[5.2]
  def change
    change_column :draws, :winning_numbers, :string
  end
end
