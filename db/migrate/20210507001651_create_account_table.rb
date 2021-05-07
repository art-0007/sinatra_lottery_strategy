class CreateAccountTable < ActiveRecord::Migration[5.2]
  def change
    create_table :account do |a|
      a.integer :user_id
    end
  end
end
