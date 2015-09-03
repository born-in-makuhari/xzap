class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :type
      t.string :email
      t.string :password
      t.string :name

      t.timestamps null: false
    end
  end
end
