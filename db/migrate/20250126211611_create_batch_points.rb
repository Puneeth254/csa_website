class CreateBatchPoints < ActiveRecord::Migration[7.2]
  def change
    create_table :batch_points do |t|
      t.string :batch_name
      t.integer :points

      t.timestamps
    end
  end
end
