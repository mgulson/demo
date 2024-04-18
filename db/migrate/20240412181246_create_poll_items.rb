class CreatePollItems < ActiveRecord::Migration[7.0]
  def change
      create_table :poll_items do |t|
      t.integer :poll_id
      t.string :value
      
      t.timestamps
    end
  end
end
