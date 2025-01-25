class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.references :product, null: false, foreign_key: true
      t.string :student_name
      t.string :roll_number
      t.string :size

      t.timestamps
    end
  end
end
