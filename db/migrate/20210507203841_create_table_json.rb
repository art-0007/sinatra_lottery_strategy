class CreateTableJson < ActiveRecord::Migration[5.2]
  def change
    create_table :all_draws do |t|
      t.json 'draw'
    end
  end
end
