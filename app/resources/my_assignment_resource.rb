class MyAssignmentResource < AssignmentResource
  model_name 'Assignment'

  def self.records(options = {})
    context = options[:context]
    context[:current_user].assignments
  end
end
