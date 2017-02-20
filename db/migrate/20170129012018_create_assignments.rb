class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :assigner, foreign_key: true
      t.references :assignee, foreign_key: true
      t.datetime :due
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
