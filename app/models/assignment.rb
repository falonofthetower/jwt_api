class Assignment < ApplicationRecord
  belongs_to :assignee, class_name: 'User', foreign_key: 'assignee_id'
  belongs_to :assigner, class_name: 'User', foreign_key: 'assigner_id'
  belongs_to :todo
  after_save :broadcast


  def broadcast
    transformed_data = JSONAPI::ResourceSerializer.new(AssignmentResource).serialize_to_hash(AssignmentResource.new(self, nil))
    ActionCable.server.broadcast("assignments", transformed_data)
  end
end
