class AddColumnIsCustomizedToMerch < ActiveRecord::Migration[7.2]
  def change
    add_column :merches, :is_customized, :string
  end
end
