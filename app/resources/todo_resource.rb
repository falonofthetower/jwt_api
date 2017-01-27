class TodoResource < JSONAPI::Resource
  attribute :task
  attribute :points
  belongs_to :user

  before_save :add_user

  def add_user
    @model.user_id = @context[:current_user].id if @model.user.nil?
  end
end
