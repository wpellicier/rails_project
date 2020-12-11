class AddTeamIdToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :team_id, :integer
  end
end
