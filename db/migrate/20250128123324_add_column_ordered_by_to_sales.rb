class AddColumnOrderedByToSales < ActiveRecord::Migration[7.2]
  def change
    add_column :sales, :ordered_by, :string
  end
end
