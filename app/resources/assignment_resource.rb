class AssignmentResource < JSONAPI::Resource
  attribute :due
  belongs_to :assigner
  belongs_to :assignee
  belongs_to :todo

  def self.records(options = {})
    context = options[:context]
    context[:current_user].assignments
  end
end
