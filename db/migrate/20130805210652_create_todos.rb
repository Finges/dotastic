class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo
      t.string :tags
      t.string :context
      t.date :datedue

      t.timestamps
    end
  end
end
