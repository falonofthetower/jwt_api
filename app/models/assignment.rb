class Assignment < ApplicationRecord
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id'
  belongs_to :assigner, class_name: 'User', foreign_key: 'assigner_id'
  belongs_to :todo
  after_save :broadcast


  def broadcast
    ActionCable.server.broadcast("assignments", @attributes)
  end
end
