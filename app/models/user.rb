class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments, source: 'assignee', foreign_key: 'assignee_id'
  has_many :tasks, through: :assignments, class_name: 'Todo', foreign_key: 'assignee_id', source: 'todo'
  has_many :todos
  has_many :requests, source: 'assigner', foreign_key: 'assigner_id', class_name: "Assignment"
  has_many :requested_tasks, through: :assignments, class_name: 'Todo', foreign_key: 'assigner_id', source: 'todo'

  def authorized_assignments
    Assignment.where('assignee_id=? OR assigner_id=?', id, id)
  end
end
