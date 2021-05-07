class AddColumnBoard < ActiveRecord::Migration[5.2]
  def change
    add_column :board, :account_id, :integer 
  end
end
