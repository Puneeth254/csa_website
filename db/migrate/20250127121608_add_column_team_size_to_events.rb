class AddColumnTeamSizeToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :team_size, :integer
  end
end
