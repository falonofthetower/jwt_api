class AddFinishedToAssignments < ActiveRecord::Migration[5.0]
  def change
    add_column :assignments, :finished, :boolean, default: false
  end
end
