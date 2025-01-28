class CreateRegistrations < ActiveRecord::Migration[7.2]
  def change
    create_table :registrations do |t|
      t.string :event_name
      t.string :team_name
      t.string :players

      t.timestamps
    end
  end
end
