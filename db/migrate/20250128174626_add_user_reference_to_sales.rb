class AddUserReferenceToSales < ActiveRecord::Migration[7.2]
  def change
    add_reference :sales, :user, null: true, foreign_key: true
  end
end
