class CreateBoardTable < ActiveRecord::Migration[5.2]
  def change
    create_table :board do |b|
      b.string :name
      b.integer :user_id
      b.integer :preference_num1
      b.integer :preference_num2
      b.integer :preference_num3
      b.integer :preference_num4
      b.integer :preference_num5
      b.integer :preference_PB
      b.date :LUCKY_DAY_1
      b.date :LUCKY_DAY_2
      b.date :LUCKY_DAY_3
      b.string :result
    end
  end
end
