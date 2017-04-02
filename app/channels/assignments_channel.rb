class AssignmentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "assignments"
  end

  def receive(data)
    ActionCable.server.broadcast "assignments", data
  end
end
