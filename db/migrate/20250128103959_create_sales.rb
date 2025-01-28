class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.string :merch_name
      t.string :name_to_be_customised
      t.string :size

      t.timestamps
    end
  end
end
