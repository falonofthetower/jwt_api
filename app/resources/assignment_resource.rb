class AssignmentResource < JSONAPI::Resource
  attribute :due
  attribute :status
  belongs_to :assigner
  belongs_to :assignee
  belongs_to :todo

  filter :status

  before_save do
    @model.assigner_id = context[:current_user].id if @model.new_record?
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].authorized_assignments
  end
end
