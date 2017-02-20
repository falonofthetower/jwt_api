class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assignments, source: 'assignee', foreign_key: 'assignee_id'
  has_many :tasks, through: :assignments, class_name: 'Todo', foreign_key: 'assignee_id', source: 'todo'
  has_many :todos
end
