class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :task
      t.integer :points
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
