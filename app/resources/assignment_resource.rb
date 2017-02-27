class AssignmentResource < JSONAPI::Resource
  attribute :due
  attribute :finished
  belongs_to :assigner
  belongs_to :assignee
  belongs_to :todo

  before_save do
    @model.assigner_id = context[:current_user].id if @model.new_record?
  end
end
