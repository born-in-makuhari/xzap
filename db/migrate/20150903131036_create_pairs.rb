class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :trainer_id
      t.integer :trainee_id

      t.timestamps null: false
    end
  end
end
