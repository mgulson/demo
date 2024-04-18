class AddPollPollItemForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :poll_items, :polls
  end
end
