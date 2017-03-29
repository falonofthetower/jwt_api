class AddDefaultValueToStatusOnAssignment < ActiveRecord::Migration[5.0]
  def change
    change_column_default :assignments, :status, 'requested'
  end
end
