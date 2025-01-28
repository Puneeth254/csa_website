class ImageUploader < CarrierWave::Uploader::Base
  storage :file  # Store files locally
  
  def store_dir
    "merch"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    @secure_token ||= SecureRandom.hex(10)
  end
end
