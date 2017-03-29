class MyRequestResource < AssignmentResource
  model_name 'Assignment'

  filter :status
  paginator :offset

  def self.records(options = {})
    context = options[:context]
    context[:current_user].requests
  end
end
