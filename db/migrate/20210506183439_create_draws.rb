class CreateDraws < ActiveRecord::Migration[5.2]
  def change
    create_table :draws do |d|
      d.date :draw_date
      d.string :winning_numbers
      d.string :multiplier
    end
  end
end



