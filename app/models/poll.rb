## Schema
# id
# name
# question
# user_id
#
# created_at
# 

class Poll < ApplicationRecord
  has_many :poll_items

end