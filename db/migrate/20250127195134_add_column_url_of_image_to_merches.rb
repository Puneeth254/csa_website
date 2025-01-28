class AddColumnUrlOfImageToMerches < ActiveRecord::Migration[7.2]
  def change
    add_column :merches, :url_of_image, :string
  end
end
