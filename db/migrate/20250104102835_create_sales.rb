class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.references :product, null: false, foreign_key: true
      t.string :customer_name
      t.integer :quantity
      t.date :sale_date

      t.timestamps
    end
  end
end
