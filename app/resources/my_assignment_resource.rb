class MyAssignmentResource < AssignmentResource
  model_name 'Assignment'

  filter :status

  def self.records(options = {})
    context = options[:context]
    context[:current_user].assignments
  end
end
