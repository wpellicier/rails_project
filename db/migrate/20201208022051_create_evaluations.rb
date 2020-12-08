class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.integer :evaluation
      t.integer :evaluator_id
      t.integer :evaluee_id
      t.integer :project_id
      t.text :comment

      t.timestamps
    end
  end
end
