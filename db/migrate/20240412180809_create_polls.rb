class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.string :question
      t.integer :user_id

      t.timestamps
    end
  end
end
