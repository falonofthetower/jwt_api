class Todo < ApplicationRecord
  belongs_to :assigner, class_name: 'User', foreign_key: 'user_id'
  has_many :assignments
  has_many :assignees, through: :assignments, class_name: 'User'
end
