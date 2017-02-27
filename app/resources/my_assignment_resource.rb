class MyAssignmentResource < AssignmentResource
  model_name 'Assignment'

  filter :finished,
    verify: ->(values, context) {
              values.collect do |value|
                value.casecmp('true') == 0
              end
            }

  def self.records(options = {})
    context = options[:context]
    context[:current_user].assignments
  end
end
