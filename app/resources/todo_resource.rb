class TodoResource < JSONAPI::Resource
  attribute :task
  attribute :points
  attribute :assigner

  before_save :add_user

  def add_user
    @model.user_id = @context[:current_user].id if @model.assigner.nil?
  end

  def self.records(options = {})
    context = options[:context]
    context[:current_user].todos
  end
end
