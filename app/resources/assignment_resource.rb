class AssignmentResource < JSONAPI::Resource
  attribute :due
  belongs_to :assigner
  belongs_to :assignee
  belongs_to :todo
end
