class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :email
      t.string :password
      t.string :name

      t.timestamps null: false
    end
  end
end
