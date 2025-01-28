class Product < ApplicationRecord
  has_many :sales
  # mount_uploader :image, ImageUploader
end
